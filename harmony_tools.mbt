///|
pub(all) enum ConsonanceClass {
  Perfect
  Imperfect
  Dissonant
} derive(Debug, Eq, ToJson)

///|
pub(all) struct VerticalEvent {
  index : Int
  lower : Int
  upper : Int
  semitones : Int
  interval_class : Int
  class : ConsonanceClass
  inversion : Bool
} derive(Debug, Eq, ToJson)

///|
pub(all) struct HarmonySummary {
  events : Int
  perfect : Int
  imperfect : Int
  dissonant : Int
  crossings : Int
  highest : Int
  lowest : Int
} derive(Debug, Eq, ToJson)

///|
pub fn consonance_class(semitones : Int) -> ConsonanceClass {
  if is_perfect_consonance(semitones) {
    Perfect
  } else if is_imperfect_consonance(semitones) {
    Imperfect
  } else {
    Dissonant
  }
}

///|
pub fn consonance_class_name(value : ConsonanceClass) -> String {
  match value {
    Perfect => "perfect"
    Imperfect => "imperfect"
    Dissonant => "dissonant"
  }
}

///|
pub fn vertical_event(lower : Note, upper : Note, index : Int) -> VerticalEvent {
  let semitones = upper.midi - lower.midi
  {
    index,
    lower: lower.midi,
    upper: upper.midi,
    semitones,
    interval_class: interval_class(semitones),
    class: consonance_class(semitones),
    inversion: upper.midi < lower.midi,
  }
}

///|
pub fn vertical_events(
  lower : Array[Note],
  upper : Array[Note],
) -> Array[VerticalEvent] {
  let result : Array[VerticalEvent] = []
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  for i in 0..<n {
    result.push(vertical_event(lower[i], upper[i], i))
  }
  result
}

///|
pub fn harmony_summary(
  lower : Array[Note],
  upper : Array[Note],
) -> HarmonySummary {
  let events = vertical_events(lower, upper)
  let mut perfect = 0
  let mut imperfect = 0
  let mut dissonant = 0
  let mut crossings = 0
  let mut highest = 0
  let mut lowest = 127
  for event in events {
    match event.class {
      Perfect => perfect += 1
      Imperfect => imperfect += 1
      Dissonant => dissonant += 1
    }
    if event.inversion {
      crossings += 1
    }
    if event.upper > highest {
      highest = event.upper
    }
    if event.lower < lowest {
      lowest = event.lower
    }
  }
  if events.length() == 0 {
    lowest = 0
  }
  {
    events: events.length(),
    perfect,
    imperfect,
    dissonant,
    crossings,
    highest,
    lowest,
  }
}

///|
pub fn perfect_ratio(lower : Array[Note], upper : Array[Note]) -> Int {
  let summary = harmony_summary(lower, upper)
  if summary.events == 0 {
    0
  } else {
    summary.perfect * 100 / summary.events
  }
}

///|
pub fn dissonance_ratio(lower : Array[Note], upper : Array[Note]) -> Int {
  let summary = harmony_summary(lower, upper)
  if summary.events == 0 {
    0
  } else {
    summary.dissonant * 100 / summary.events
  }
}

///|
pub fn interval_class_name(value : Int) -> String {
  match interval_class(value) {
    0 => "unison"
    1 => "minor second"
    2 => "major second"
    3 => "minor third"
    4 => "major third"
    5 => "perfect fourth"
    6 => "tritone"
    7 => "perfect fifth"
    8 => "minor sixth"
    9 => "major sixth"
    10 => "minor seventh"
    _ => "major seventh"
  }
}

///|
pub fn interval_is_stable(value : Int) -> Bool {
  is_perfect_consonance(value) || is_imperfect_consonance(value)
}

///|
pub fn interval_tension(value : Int) -> Int {
  match consonance_class(value) {
    Perfect => 0
    Imperfect => 1
    Dissonant => 3
  }
}

///|
pub fn total_tension(lower : Array[Note], upper : Array[Note]) -> Int {
  let mut result = 0
  for event in vertical_events(lower, upper) {
    result += interval_tension(event.semitones)
  }
  result
}

///|
pub fn tension_profile(lower : Array[Note], upper : Array[Note]) -> Array[Int] {
  let result : Array[Int] = []
  for event in vertical_events(lower, upper) {
    result.push(interval_tension(event.semitones))
  }
  result
}

///|
pub fn stable_event_indices(
  lower : Array[Note],
  upper : Array[Note],
) -> Array[Int] {
  let result : Array[Int] = []
  for event in vertical_events(lower, upper) {
    if interval_is_stable(event.semitones) {
      result.push(event.index)
    }
  }
  result
}

///|
pub fn unstable_event_indices(
  lower : Array[Note],
  upper : Array[Note],
) -> Array[Int] {
  let result : Array[Int] = []
  for event in vertical_events(lower, upper) {
    if !interval_is_stable(event.semitones) {
      result.push(event.index)
    }
  }
  result
}

///|
pub fn first_dissonance(lower : Array[Note], upper : Array[Note]) -> Int? {
  for event in vertical_events(lower, upper) {
    if event.class == Dissonant {
      return Some(event.index)
    }
  }
  None
}

///|
pub fn last_dissonance(lower : Array[Note], upper : Array[Note]) -> Int? {
  let mut result : Int? = None
  for event in vertical_events(lower, upper) {
    if event.class == Dissonant {
      result = Some(event.index)
    }
  }
  result
}

///|
pub fn consecutive_perfects(
  lower : Array[Note],
  upper : Array[Note],
) -> Array[Int] {
  let result : Array[Int] = []
  let mut run = 0
  for event in vertical_events(lower, upper) {
    if event.class == Perfect {
      run += 1
    } else {
      if run > 1 {
        result.push(run)
      }
      run = 0
    }
  }
  if run > 1 {
    result.push(run)
  }
  result
}

///|
pub fn harmonic_motion_labels(
  lower : Array[Note],
  upper : Array[Note],
) -> Array[String] {
  let result : Array[String] = []
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  if n < 2 {
    return result
  }
  for i in 1..<n {
    let movement = motion(lower[i - 1], lower[i], upper[i - 1], upper[i])
    result.push(
      match movement {
        Parallel => "parallel"
        Similar => "similar"
        Contrary => "contrary"
        Oblique => "oblique"
        Static => "static"
      },
    )
  }
  result
}

///|
pub fn harmonic_motion_count(
  lower : Array[Note],
  upper : Array[Note],
  label : String,
) -> Int {
  let mut result = 0
  for value in harmonic_motion_labels(lower, upper) {
    if value == label {
      result += 1
    }
  }
  result
}

///|
pub fn voice_order_is_stable(lower : Array[Note], upper : Array[Note]) -> Bool {
  crossing_count(lower, upper) == 0
}

///|
pub fn final_sonority_is_valid(
  lower : Array[Note],
  upper : Array[Note],
) -> Bool {
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  if n == 0 {
    false
  } else {
    interval_class(harmonic_interval(lower[n - 1], upper[n - 1])) == 0 ||
    interval_class(harmonic_interval(lower[n - 1], upper[n - 1])) == 7
  }
}

///|
pub fn harmonic_signature(lower : Array[Note], upper : Array[Note]) -> String {
  let parts : Array[String] = []
  for event in vertical_events(lower, upper) {
    parts.push("\{event.interval_class}")
  }
  parts.join("-")
}
