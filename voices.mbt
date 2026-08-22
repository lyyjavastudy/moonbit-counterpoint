///|
pub(all) enum VoiceRange {
  Soprano
  Alto
  Tenor
  Bass
  CustomRange(low~ : Int, high~ : Int)
} derive(Debug, Eq, ToJson)

///|
pub(all) struct VoiceAssessment {
  role : VoiceRole
  range : VoiceRange
  notes : Int
  violations : Int
  lowest : Int
  highest : Int
} derive(Debug, Eq, ToJson)

///|
pub fn VoiceRange::low(self : VoiceRange) -> Int {
  match self {
    Soprano => 60
    Alto => 48
    Tenor => 40
    Bass => 28
    CustomRange(low~, ..) => low
  }
}

///|
pub fn VoiceRange::high(self : VoiceRange) -> Int {
  match self {
    Soprano => 84
    Alto => 72
    Tenor => 67
    Bass => 55
    CustomRange(high~, ..) => high
  }
}

///|
pub fn VoiceRange::contains(self : VoiceRange, midi : Int) -> Bool {
  self.low() <= midi && midi <= self.high()
}

///|
pub fn VoiceRange::width(self : VoiceRange) -> Int {
  self.high() - self.low()
}

///|
pub fn assess_voice(
  notes : Array[Note],
  role : VoiceRole,
  range : VoiceRange,
) -> VoiceAssessment {
  let mut lowest = 127
  let mut highest = -1
  let mut violations = 0
  for note in notes {
    if note.midi < lowest {
      lowest = note.midi
    }
    if note.midi > highest {
      highest = note.midi
    }
    if !range.contains(note.midi) {
      violations += 1
    }
  }
  { role, range, notes: notes.length(), violations, lowest, highest }
}

///|
pub fn VoiceAssessment::passed(self : VoiceAssessment) -> Bool {
  self.violations == 0
}

///|
pub fn VoiceAssessment::span(self : VoiceAssessment) -> Int {
  if self.notes == 0 {
    0
  } else {
    self.highest - self.lowest
  }
}

///|
pub fn voice_crossing_at(lower : Note, upper : Note) -> Bool {
  lower.midi >= upper.midi
}

///|
pub fn crossing_count(lower : Array[Note], upper : Array[Note]) -> Int {
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  let mut total = 0
  for i in 0..<n {
    if voice_crossing_at(lower[i], upper[i]) {
      total += 1
    }
  }
  total
}

///|
pub fn aligned_pairs(lower : Array[Note], upper : Array[Note]) -> Int {
  let n = if lower.length() < upper.length() {
    lower.length()
  } else {
    upper.length()
  }
  let mut total = 0
  for i in 0..<n {
    if lower[i].onset == upper[i].onset {
      total += 1
    }
  }
  total
}

///|
pub fn average_pitch(notes : Array[Note]) -> Int {
  if notes.length() == 0 {
    return 0
  }
  let mut sum = 0
  for note in notes {
    sum += note.midi
  }
  sum / notes.length()
}

///|
pub fn register_distance(notes : Array[Note], target : Int) -> Int {
  let mut sum = 0
  for note in notes {
    sum += if note.midi > target {
      note.midi - target
    } else {
      target - note.midi
    }
  }
  if notes.length() == 0 {
    0
  } else {
    sum / notes.length()
  }
}
