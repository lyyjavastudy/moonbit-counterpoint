///|
pub(all) struct MotionConstraint {
  name : String
  allow_parallel : Bool
  allow_similar : Bool
  allow_contrary : Bool
  allow_oblique : Bool
  max_leap : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct MotionResult {
  motion : MotionKind
  accepted : Bool
  cost : Int
  message : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct VoiceLeadingSummary {
  transitions : Int
  accepted : Int
  rejected : Int
  contrary : Int
  parallel : Int
  similar : Int
  oblique : Int
  total_cost : Int
} derive(Debug, Eq, ToJson)

///|
pub fn MotionConstraint::classroom() -> MotionConstraint {
  {
    name: "classroom",
    allow_parallel: false,
    allow_similar: true,
    allow_contrary: true,
    allow_oblique: true,
    max_leap: 12,
  }
}

///|
pub fn MotionConstraint::strict() -> MotionConstraint {
  {
    name: "strict",
    allow_parallel: false,
    allow_similar: false,
    allow_contrary: true,
    allow_oblique: true,
    max_leap: 9,
  }
}

///|
pub fn MotionConstraint::allows(
  self : MotionConstraint,
  motion_value : MotionKind,
) -> Bool {
  match motion_value {
    Parallel => self.allow_parallel
    Similar => self.allow_similar
    Contrary => self.allow_contrary
    Oblique => self.allow_oblique
    Static => true
  }
}

///|
pub fn motion_cost(value : MotionKind) -> Int {
  match value {
    Contrary => 0
    Oblique => 1
    Similar => 2
    Parallel => 5
    Static => 1
  }
}

///|
pub fn evaluate_motion(
  lower_before : Note,
  lower_after : Note,
  upper_before : Note,
  upper_after : Note,
  constraint : MotionConstraint,
) -> MotionResult {
  let movement = motion(lower_before, lower_after, upper_before, upper_after)
  let leap = absolute_melodic_interval(upper_before, upper_after)
  let leap_ok = leap <= constraint.max_leap
  let accepted = constraint.allows(movement) && leap_ok
  {
    motion: movement,
    accepted,
    cost: motion_cost(movement) + (if leap_ok { 0 } else { 10 }),
    message: if accepted {
      "motion satisfies the selected constraint"
    } else {
      "motion should be revised for the selected constraint"
    },
  }
}

///|
pub fn evaluate_voice_leading(
  lower : Array[Note],
  upper : Array[Note],
  constraint : MotionConstraint,
) -> Array[MotionResult] {
  let result : Array[MotionResult] = []
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  if n < 2 {
    return result
  }
  for i in 1..<n {
    result.push(
      evaluate_motion(
        lower[i - 1],
        lower[i],
        upper[i - 1],
        upper[i],
        constraint,
      ),
    )
  }
  result
}

///|
pub fn summarize_voice_leading(
  lower : Array[Note],
  upper : Array[Note],
  constraint : MotionConstraint,
) -> VoiceLeadingSummary {
  let results = evaluate_voice_leading(lower, upper, constraint)
  let mut accepted = 0
  let mut rejected = 0
  let mut contrary = 0
  let mut parallel = 0
  let mut similar = 0
  let mut oblique = 0
  let mut total_cost = 0
  for result in results {
    if result.accepted {
      accepted += 1
    } else {
      rejected += 1
    }
    total_cost += result.cost
    match result.motion {
      Contrary => contrary += 1
      Parallel => parallel += 1
      Similar => similar += 1
      Oblique => oblique += 1
      Static => ()
    }
  }
  {
    transitions: results.length(),
    accepted,
    rejected,
    contrary,
    parallel,
    similar,
    oblique,
    total_cost,
  }
}

///|
pub fn motion_acceptance_rate(summary : VoiceLeadingSummary) -> Int {
  if summary.transitions == 0 {
    0
  } else {
    summary.accepted * 100 / summary.transitions
  }
}

///|
pub fn motion_rejection_indices(
  lower : Array[Note],
  upper : Array[Note],
  constraint : MotionConstraint,
) -> Array[Int] {
  let result : Array[Int] = []
  for i, item in evaluate_voice_leading(lower, upper, constraint) {
    if !item.accepted {
      result.push(i + 1)
    }
  }
  result
}

///|
pub fn contrary_motion_ratio(lower : Array[Note], upper : Array[Note]) -> Int {
  let summary = pair_statistics(lower, upper)
  let total = summary.contrary +
    summary.parallel +
    summary.similar +
    summary.oblique +
    summary.static_motion
  if total == 0 {
    0
  } else {
    summary.contrary * 100 / total
  }
}

///|
pub fn parallel_perfect_indices(
  lower : Array[Note],
  upper : Array[Note],
) -> Array[Int] {
  let result : Array[Int] = []
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  if n < 2 {
    return result
  }
  for i in 1..<n {
    let old_interval = harmonic_interval(lower[i - 1], upper[i - 1])
    let new_interval = harmonic_interval(lower[i], upper[i])
    let movement = motion(lower[i - 1], lower[i], upper[i - 1], upper[i])
    if movement == Parallel &&
      is_perfect_consonance(old_interval) &&
      is_perfect_consonance(new_interval) {
      result.push(i)
    }
  }
  result
}

///|
pub fn hidden_perfect_indices(
  lower : Array[Note],
  upper : Array[Note],
) -> Array[Int] {
  let result : Array[Int] = []
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  if n < 2 {
    return result
  }
  for i in 1..<n {
    let interval = harmonic_interval(lower[i], upper[i])
    let movement = motion(lower[i - 1], lower[i], upper[i - 1], upper[i])
    if movement == Similar && is_perfect_consonance(interval) {
      result.push(i)
    }
  }
  result
}

///|
pub fn voice_leading_quality(lower : Array[Note], upper : Array[Note]) -> Int {
  let summary = summarize_voice_leading(
    lower,
    upper,
    MotionConstraint::classroom(),
  )
  100 - summary.rejected * 20 - summary.parallel * 5
}

///|
pub fn cap_quality(value : Int) -> Int {
  if value < 0 {
    0
  } else if value > 100 {
    100
  } else {
    value
  }
}

///|
pub fn constrained_quality(
  lower : Array[Note],
  upper : Array[Note],
  constraint : MotionConstraint,
) -> Int {
  let summary = summarize_voice_leading(lower, upper, constraint)
  cap_quality(100 - summary.rejected * 20 - summary.total_cost)
}
