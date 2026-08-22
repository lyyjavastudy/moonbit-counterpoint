///|
pub(all) enum ContourStep {
  Rising
  Falling
  Repeated
  LeapUp
  LeapDown
} derive(Debug, Eq, ToJson)

///|
pub(all) enum IntervalSize {
  Unison
  Step
  Third
  Fourth
  Fifth
  Sixth
  Seventh
  Octave
  Compound
} derive(Debug, Eq, ToJson)

///|
pub(all) struct ContourSummary {
  notes : Int
  rising : Int
  falling : Int
  repeated : Int
  leaps : Int
  turning_points : Int
  first_pitch : Int
  last_pitch : Int
  range : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct TurningPoint {
  index : Int
  pitch : Int
  before : Direction
  after : Direction
} derive(Debug, Eq, ToJson)

///|
pub fn interval_size(semitones : Int) -> IntervalSize {
  let value = if semitones < 0 { -semitones } else { semitones }
  if value == 0 {
    Unison
  } else if value <= 2 {
    Step
  } else if value <= 4 {
    Third
  } else if value <= 5 {
    Fourth
  } else if value <= 7 {
    Fifth
  } else if value <= 9 {
    Sixth
  } else if value <= 11 {
    Seventh
  } else if value <= 12 {
    Octave
  } else {
    Compound
  }
}

///|
pub fn is_step(semitones : Int) -> Bool {
  let value = if semitones < 0 { -semitones } else { semitones }
  value > 0 && value <= 2
}

///|
pub fn is_leap(semitones : Int) -> Bool {
  let value = if semitones < 0 { -semitones } else { semitones }
  value > 2
}

///|
pub fn contour_step(left : Note, right : Note) -> ContourStep {
  let delta = right.midi - left.midi
  if delta == 0 {
    Repeated
  } else if delta > 2 {
    LeapUp
  } else if delta < -2 {
    LeapDown
  } else if delta > 0 {
    Rising
  } else {
    Falling
  }
}

///|
pub fn contour_steps(notes : Array[Note]) -> Array[ContourStep] {
  let result : Array[ContourStep] = []
  if notes.length() < 2 {
    return result
  }
  for i in 1..<notes.length() {
    result.push(contour_step(notes[i - 1], notes[i]))
  }
  result
}

///|
pub fn turning_points(notes : Array[Note]) -> Array[TurningPoint] {
  let result : Array[TurningPoint] = []
  if notes.length() < 3 {
    return result
  }
  for i in 1..<(notes.length() - 1) {
    let before = direction(notes[i - 1], notes[i])
    let after = direction(notes[i], notes[i + 1])
    if before != Same && after != Same && before != after {
      result.push({ index: i, pitch: notes[i].midi, before, after })
    }
  }
  result
}

///|
pub fn contour_label(step : ContourStep) -> String {
  match step {
    Rising => "rise"
    Falling => "fall"
    Repeated => "repeat"
    LeapUp => "leap-up"
    LeapDown => "leap-down"
  }
}

///|
pub fn count_contour(notes : Array[Note], step : ContourStep) -> Int {
  let mut result = 0
  for current in contour_steps(notes) {
    if current == step {
      result += 1
    }
  }
  result
}

///|
pub fn count_direction(notes : Array[Note], direction_value : Direction) -> Int {
  let mut result = 0
  if notes.length() < 2 {
    return result
  }
  for i in 1..<notes.length() {
    if direction(notes[i - 1], notes[i]) == direction_value {
      result += 1
    }
  }
  result
}

///|
pub fn repeated_run_lengths(notes : Array[Note]) -> Array[Int] {
  let result : Array[Int] = []
  if notes.length() == 0 {
    return result
  }
  let mut run = 1
  for i in 1..<notes.length() {
    if notes[i].midi == notes[i - 1].midi {
      run += 1
    } else {
      result.push(run)
      run = 1
    }
  }
  result.push(run)
  result
}

///|
pub fn largest_repeated_run(notes : Array[Note]) -> Int {
  let mut result = 0
  for length in repeated_run_lengths(notes) {
    if length > result {
      result = length
    }
  }
  result
}

///|
pub fn contour_range(notes : Array[Note]) -> Int {
  if notes.length() == 0 {
    return 0
  }
  let mut low = notes[0].midi
  let mut high = notes[0].midi
  for note in notes {
    if note.midi < low {
      low = note.midi
    }
    if note.midi > high {
      high = note.midi
    }
  }
  high - low
}

///|
pub fn contour_summary(notes : Array[Note]) -> ContourSummary {
  let steps = contour_steps(notes)
  let turns = turning_points(notes)
  let first = first_pitch(notes)
  let last = last_pitch(notes)
  let mut rising = 0
  let mut falling = 0
  let mut repeated = 0
  let mut leaps = 0
  for step in steps {
    match step {
      Rising => rising += 1
      Falling => falling += 1
      Repeated => repeated += 1
      LeapUp | LeapDown => leaps += 1
    }
  }
  {
    notes: notes.length(),
    rising,
    falling,
    repeated,
    leaps,
    turning_points: turns.length(),
    first_pitch: match first {
      Some(value) => value
      None => 0
    },
    last_pitch: match last {
      Some(value) => value
      None => 0
    },
    range: contour_range(notes),
  }
}

///|
pub fn contour_balance(notes : Array[Note]) -> Int {
  let summary = contour_summary(notes)
  (summary.rising - summary.falling) *
  100 /
  (if summary.notes == 0 { 1 } else { summary.notes })
}

///|
pub fn is_arch_shape(notes : Array[Note]) -> Bool {
  let turns = turning_points(notes)
  if turns.length() != 1 || notes.length() < 3 {
    return false
  }
  turns[0].before == Up && turns[0].after == Down
}

///|
pub fn is_valley_shape(notes : Array[Note]) -> Bool {
  let turns = turning_points(notes)
  if turns.length() != 1 || notes.length() < 3 {
    return false
  }
  turns[0].before == Down && turns[0].after == Up
}

///|
pub fn direction_name(value : Direction) -> String {
  match value {
    Up => "up"
    Down => "down"
    Same => "same"
  }
}

///|
pub fn interval_size_name(value : IntervalSize) -> String {
  match value {
    Unison => "unison"
    Step => "step"
    Third => "third"
    Fourth => "fourth"
    Fifth => "fifth"
    Sixth => "sixth"
    Seventh => "seventh"
    Octave => "octave"
    Compound => "compound"
  }
}

///|
pub fn melodic_interval_histogram(notes : Array[Note]) -> Array[Int] {
  let result = Array::make(13, 0)
  if notes.length() < 2 {
    return result
  }
  for i in 1..<notes.length() {
    let value = absolute_melodic_interval(notes[i - 1], notes[i])
    let index = if value > 12 { 12 } else { value }
    result[index] += 1
  }
  result
}

///|
pub fn average_interval(notes : Array[Note]) -> Int {
  if notes.length() < 2 {
    return 0
  }
  let mut total = 0
  for i in 1..<notes.length() {
    total += absolute_melodic_interval(notes[i - 1], notes[i])
  }
  total / (notes.length() - 1)
}

///|
pub fn contrary_motion_count(
  cantus : Array[Note],
  counter : Array[Note],
) -> Int {
  let n = if cantus.length() < counter.length() {
    cantus.length()
  } else {
    counter.length()
  }
  if n < 2 {
    return 0
  }
  let mut result = 0
  for i in 1..<n {
    let left = direction(cantus[i - 1], cantus[i])
    let right = direction(counter[i - 1], counter[i])
    if left != Same && right != Same && left != right {
      result += 1
    }
  }
  result
}
