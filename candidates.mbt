///|
pub(all) struct CandidatePolicy {
  low : Int
  high : Int
  max_leap : Int
  require_consonance : Bool
  prefer_contrary : Bool
  avoid_repetition : Bool
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PitchCandidate {
  note : Note
  vertical_interval : Int
  melodic_interval : Int
  consonant : Bool
  motion : MotionKind
  score : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct CandidateBatch {
  source : Note
  candidates : Array[PitchCandidate]
  accepted : Int
  rejected : Int
} derive(Debug, Eq, ToJson)

///|
pub fn CandidatePolicy::default() -> CandidatePolicy {
  {
    low: 48,
    high: 84,
    max_leap: 12,
    require_consonance: true,
    prefer_contrary: true,
    avoid_repetition: false,
  }
}

///|
pub fn CandidatePolicy::strict() -> CandidatePolicy {
  {
    low: 55,
    high: 79,
    max_leap: 9,
    require_consonance: true,
    prefer_contrary: true,
    avoid_repetition: true,
  }
}

///|
pub fn CandidatePolicy::is_valid(self : CandidatePolicy) -> Bool {
  self.low >= 0 &&
  self.high <= 127 &&
  self.low <= self.high &&
  self.max_leap >= 0
}

///|
pub fn candidate_note(source : Note, midi : Int) -> Note {
  Note::new(
    midi~,
    onset=source.onset,
    duration=source.duration,
    tied_from_previous=source.tied_from_previous,
    label=pitch_label(midi),
  )
}

///|
pub fn candidate_motion(
  cantus_before : Note,
  cantus_after : Note,
  counter_before : Note,
  counter_after : Note,
) -> MotionKind {
  motion(cantus_before, cantus_after, counter_before, counter_after)
}

///|
pub fn candidate_score(
  vertical : Int,
  melodic : Int,
  motion_value : MotionKind,
  policy : CandidatePolicy,
) -> Int {
  let consonance_score = if is_consonance(vertical) { 40 } else { -60 }
  let leap = if melodic < 0 { -melodic } else { melodic }
  let leap_score = if leap <= 2 {
    25
  } else if leap <= policy.max_leap {
    10
  } else {
    -40
  }
  let motion_score = if policy.prefer_contrary && motion_value == Contrary {
    20
  } else {
    0
  }
  consonance_score + leap_score + motion_score
}

///|
pub fn candidate_is_allowed(
  cantus : Note,
  previous : Note?,
  candidate : Note,
  policy : CandidatePolicy,
) -> Bool {
  if !policy.is_valid() ||
    candidate.midi < policy.low ||
    candidate.midi > policy.high {
    false
  } else {
    let vertical = harmonic_interval(cantus, candidate)
    let melodic = match previous {
      None => 0
      Some(note) => melodic_interval(note, candidate)
    }
    let leap = if melodic < 0 { -melodic } else { melodic }
    let consonant_ok = !policy.require_consonance || is_consonance(vertical)
    let leap_ok = previous is None || leap <= policy.max_leap
    let repeat_ok = match previous {
      None => true
      Some(note) => !policy.avoid_repetition || note.midi != candidate.midi
    }
    consonant_ok && leap_ok && repeat_ok
  }
}

///|
pub fn generate_candidates(
  cantus : Note,
  previous : Note?,
  policy : CandidatePolicy,
) -> Array[PitchCandidate] {
  let result : Array[PitchCandidate] = []
  if !policy.is_valid() {
    return result
  }
  for midi in policy.low..<=policy.high {
    let candidate = candidate_note(cantus, midi)
    if candidate_is_allowed(cantus, previous, candidate, policy) {
      let vertical = harmonic_interval(cantus, candidate)
      let melodic = match previous {
        None => 0
        Some(note) => melodic_interval(note, candidate)
      }
      let score = candidate_score(vertical, melodic, Static, policy)
      result.push({
        note: candidate,
        vertical_interval: vertical,
        melodic_interval: melodic,
        consonant: is_consonance(vertical),
        motion: Static,
        score,
      })
    }
  }
  result
}

///|
pub fn generate_voice_candidates(
  cantus_before : Note,
  cantus_after : Note,
  counter_before : Note?,
  policy : CandidatePolicy,
) -> CandidateBatch {
  let result : Array[PitchCandidate] = []
  let mut rejected = 0
  for midi in policy.low..<=policy.high {
    let candidate = candidate_note(cantus_after, midi)
    let allowed = candidate_is_allowed(
      cantus_after, counter_before, candidate, policy,
    )
    if allowed {
      let vertical = harmonic_interval(cantus_after, candidate)
      let melodic = match counter_before {
        None => 0
        Some(note) => melodic_interval(note, candidate)
      }
      let motion_value = match counter_before {
        None => Static
        Some(note) =>
          candidate_motion(cantus_before, cantus_after, note, candidate)
      }
      result.push({
        note: candidate,
        vertical_interval: vertical,
        melodic_interval: melodic,
        consonant: is_consonance(vertical),
        motion: motion_value,
        score: candidate_score(vertical, melodic, motion_value, policy),
      })
    } else {
      rejected += 1
    }
  }
  {
    source: cantus_after,
    candidates: result,
    accepted: result.length(),
    rejected,
  }
}

///|
pub fn candidate_has_rule(candidate : PitchCandidate, rule : RuleKind) -> Bool {
  match rule {
    DissonancePlacement => !candidate.consonant
    LargeLeap => {
      let leap = if candidate.melodic_interval < 0 {
        -candidate.melodic_interval
      } else {
        candidate.melodic_interval
      }
      leap > 12
    }
    ParallelPerfect =>
      candidate.motion == Parallel &&
      is_perfect_consonance(candidate.vertical_interval)
    HiddenPerfect =>
      candidate.motion == Similar &&
      is_perfect_consonance(candidate.vertical_interval)
    _ => false
  }
}

///|
pub fn candidate_count_in_range(
  candidates : Array[PitchCandidate],
  low : Int,
  high : Int,
) -> Int {
  let mut result = 0
  for candidate in candidates {
    if low <= candidate.note.midi && candidate.note.midi <= high {
      result += 1
    }
  }
  result
}

///|
pub fn candidate_scores(candidates : Array[PitchCandidate]) -> Array[Int] {
  let result : Array[Int] = []
  for candidate in candidates {
    result.push(candidate.score)
  }
  result
}

///|
pub fn best_candidate(candidates : Array[PitchCandidate]) -> PitchCandidate? {
  if candidates.length() == 0 {
    return None
  }
  let mut best = candidates[0]
  for candidate in candidates {
    if candidate.score > best.score {
      best = candidate
    }
  }
  Some(best)
}

///|
pub fn best_candidates(
  candidates : Array[PitchCandidate],
  limit : Int,
) -> Array[PitchCandidate] {
  let result : Array[PitchCandidate] = []
  let remaining = candidates
  let count = if limit < 0 {
    0
  } else if limit > remaining.length() {
    remaining.length()
  } else {
    limit
  }
  for _ in 0..<count {
    match best_candidate(remaining) {
      None => ()
      Some(best) => {
        result.push(best)
        let mut found = false
        let copy : Array[PitchCandidate] = []
        for candidate in remaining {
          if !found && candidate == best {
            found = true
          } else {
            copy.push(candidate)
          }
        }
      }
    }
  }
  result
}

///|
pub fn candidate_range(candidates : Array[PitchCandidate]) -> Int {
  if candidates.length() == 0 {
    return 0
  }
  let mut low = candidates[0].note.midi
  let mut high = low
  for candidate in candidates {
    if candidate.note.midi < low {
      low = candidate.note.midi
    }
    if candidate.note.midi > high {
      high = candidate.note.midi
    }
  }
  high - low
}
