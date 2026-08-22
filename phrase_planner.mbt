///|
pub(all) enum PhraseRole {
  Opening
  Continuation
  Preparation
  Cadence
  Extension
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PhraseSegment {
  start : Int
  end : Int
  role : PhraseRole
  notes : Int
  pitch_range : Int
  density : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct CadencePlan {
  penultimate : Int
  final_pitch : Int
  final_interval : Int
  approach : Direction
  valid : Bool
  message : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PhrasePlan {
  segments : Array[PhraseSegment]
  cadence : CadencePlan
  total_notes : Int
  balanced : Bool
} derive(Debug, Eq, ToJson)

///|
pub fn PhraseRole::label(self : PhraseRole) -> String {
  match self {
    Opening => "opening"
    Continuation => "continuation"
    Preparation => "preparation"
    Cadence => "cadence"
    Extension => "extension"
  }
}

///|
pub fn split_points(notes : Array[Note], target : Int) -> Array[Int] {
  let result : Array[Int] = []
  if target <= 0 || notes.length() == 0 {
    return result
  }
  let mut index = target
  while index < notes.length() {
    result.push(index)
    index += target
  }
  result
}

///|
pub fn role_for_segment(index : Int, total : Int) -> PhraseRole {
  if total <= 1 {
    Opening
  } else if index == 0 {
    Opening
  } else if index == total - 1 {
    Cadence
  } else if index == 1 {
    Continuation
  } else {
    Preparation
  }
}

///|
pub fn make_segment(
  notes : Array[Note],
  start : Int,
  end : Int,
  role : PhraseRole,
) -> PhraseSegment {
  let safe_start = if start < 0 { 0 } else { start }
  let safe_end = if end > notes.length() {
    notes.length()
  } else if end < safe_start {
    safe_start
  } else {
    end
  }
  let selected : Array[Note] = []
  for i in safe_start..<safe_end {
    selected.push(notes[i])
  }
  {
    start: safe_start,
    end: safe_end,
    role,
    notes: selected.length(),
    pitch_range: contour_range(selected),
    density: if safe_end == safe_start {
      0
    } else {
      selected.length() * 100 / (safe_end - safe_start)
    },
  }
}

///|
pub fn segment_phrase(
  notes : Array[Note],
  target : Int,
) -> Array[PhraseSegment] {
  let points = split_points(notes, target)
  let segments : Array[PhraseSegment] = []
  let mut start = 0
  for end in points {
    segments.push(
      make_segment(
        notes,
        start,
        end,
        role_for_segment(segments.length(), points.length() + 1),
      ),
    )
    start = end
  }
  if start <= notes.length() {
    segments.push(
      make_segment(
        notes,
        start,
        notes.length(),
        role_for_segment(segments.length(), points.length() + 1),
      ),
    )
  }
  segments
}

///|
pub fn cadence_plan(cantus : Array[Note], counter : Array[Note]) -> CadencePlan {
  let n = if cantus.length() < counter.length() {
    cantus.length()
  } else {
    counter.length()
  }
  if n < 2 {
    return {
      penultimate: 0,
      final_pitch: 0,
      final_interval: 0,
      approach: Same,
      valid: false,
      message: "a cadence needs at least two aligned events",
    }
  }
  let final_interval = interval_class(
    harmonic_interval(cantus[n - 1], counter[n - 1]),
  )
  let approach = direction(counter[n - 2], counter[n - 1])
  let valid_interval = final_interval == 0 || final_interval == 7
  {
    penultimate: counter[n - 2].midi,
    final_pitch: counter[n - 1].midi,
    final_interval,
    approach,
    valid: valid_interval,
    message: if valid_interval {
      "cadence sonority is consonant"
    } else {
      "choose a unison, octave, or fifth at the final event"
    },
  }
}

///|
pub fn cadence_candidates(
  cantus : Note,
  final_pitch : Int,
  policy : CandidatePolicy,
) -> Array[PitchCandidate] {
  let source = Note::new(
    midi=final_pitch,
    onset=cantus.onset,
    duration=cantus.duration,
  )
  let candidates = generate_candidates(cantus, None, policy)
  let result : Array[PitchCandidate] = []
  for candidate in candidates {
    let interval = interval_class(harmonic_interval(cantus, candidate.note))
    if interval == 0 || interval == 7 {
      result.push({
        ..candidate,
        note: { ..candidate.note, midi: candidate.note.midi },
      })
    }
  }
  ignore(source)
  result
}

///|
pub fn plan_phrase(
  cantus : Array[Note],
  counter : Array[Note],
  segment_size : Int,
) -> PhrasePlan {
  let segments = segment_phrase(counter, segment_size)
  let cadence = cadence_plan(cantus, counter)
  let mut balanced = true
  for segment in segments {
    if segment.density == 0 || segment.pitch_range > 24 {
      balanced = false
    }
  }
  { segments, cadence, total_notes: counter.length(), balanced }
}

///|
pub fn phrase_length(plan : PhrasePlan) -> Int {
  let mut result = 0
  for segment in plan.segments {
    result += segment.notes
  }
  result
}

///|
pub fn cadence_message(plan : PhrasePlan) -> String {
  plan.cadence.message
}

///|
pub fn phrase_role_counts(plan : PhrasePlan) -> Array[Int] {
  let result = Array::make(5, 0)
  for segment in plan.segments {
    let index = match segment.role {
      Opening => 0
      Continuation => 1
      Preparation => 2
      Cadence => 3
      Extension => 4
    }
    result[index] += 1
  }
  result
}

///|
pub fn phrase_is_cadential(plan : PhrasePlan) -> Bool {
  plan.cadence.valid && plan.segments.length() > 0
}
