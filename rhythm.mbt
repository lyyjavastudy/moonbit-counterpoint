///|
pub(all) enum BeatStrength {
  Downbeat
  Strong
  Weak
  Offbeat
} derive(Debug, Eq, ToJson)

///|
pub(all) struct Meter {
  numerator : Int
  denominator : Int
  subdivision : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct BeatPoint {
  index : Int
  time : Int
  measure : Int
  beat : Int
  strength : BeatStrength
} derive(Debug, Eq, ToJson)

///|
pub(all) struct RhythmSummary {
  notes : Int
  measures : Int
  downbeats : Int
  offbeats : Int
  syncopations : Int
  tied_notes : Int
  total_duration : Int
} derive(Debug, Eq, ToJson)

///|
pub fn Meter::new(
  numerator~ : Int,
  denominator~ : Int,
  subdivision? : Int = 1,
) -> Meter {
  { numerator, denominator, subdivision }
}

///|
pub fn Meter::is_valid(self : Meter) -> Bool {
  self.numerator > 0 &&
  self.denominator > 0 &&
  self.subdivision > 0 &&
  self.numerator <= 16 &&
  self.denominator <= 32
}

///|
pub fn Meter::measure_length(self : Meter) -> Int {
  if !self.is_valid() {
    0
  } else {
    self.numerator * self.subdivision
  }
}

///|
pub fn Meter::beat_length(self : Meter) -> Int {
  if self.subdivision <= 0 {
    1
  } else {
    self.subdivision
  }
}

///|
pub fn Meter::beats_per_measure(self : Meter) -> Int {
  if self.numerator <= 0 {
    1
  } else {
    self.numerator
  }
}

///|
pub fn beat_strength(meter : Meter, beat : Int) -> BeatStrength {
  let normalized = if meter.numerator <= 0 { 0 } else { beat % meter.numerator }
  if normalized == 0 {
    Downbeat
  } else if meter.numerator % 2 == 0 && normalized == meter.numerator / 2 {
    Strong
  } else if normalized % 2 == 0 {
    Weak
  } else {
    Offbeat
  }
}

///|
pub fn beat_point(meter : Meter, time : Int, index : Int) -> BeatPoint {
  let length = meter.measure_length()
  let safe_length = if length <= 0 { 1 } else { length }
  let measure = time / safe_length
  let offset = time % safe_length
  let beat_length = meter.beat_length()
  let beat = if beat_length <= 0 { 0 } else { offset / beat_length }
  { index, time, measure, beat, strength: beat_strength(meter, beat) }
}

///|
pub fn beat_points(meter : Meter, notes : Array[Note]) -> Array[BeatPoint] {
  let result : Array[BeatPoint] = []
  for i, note in notes {
    result.push(beat_point(meter, note.onset, i))
  }
  result
}

///|
pub fn is_accented(point : BeatPoint) -> Bool {
  point.strength == Downbeat || point.strength == Strong
}

///|
pub fn is_weak(point : BeatPoint) -> Bool {
  point.strength == Weak || point.strength == Offbeat
}

///|
pub fn beat_label(point : BeatPoint) -> String {
  match point.strength {
    Downbeat => "downbeat"
    Strong => "strong"
    Weak => "weak"
    Offbeat => "offbeat"
  }
}

///|
pub fn quantize_time(time : Int, grid : Int) -> Int {
  if grid <= 0 {
    time
  } else {
    let remainder = time % grid
    if remainder * 2 < grid {
      time - remainder
    } else {
      time + grid - remainder
    }
  }
}

///|
pub fn quantize_note(note : Note, grid : Int) -> Note {
  { ..note, onset: quantize_time(note.onset, grid) }
}

///|
pub fn quantize_sequence(notes : Array[Note], grid : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    result.push(quantize_note(note, grid))
  }
  result
}

///|
pub fn measure_of(meter : Meter, time : Int) -> Int {
  let length = meter.measure_length()
  if length <= 0 {
    0
  } else {
    time / length
  }
}

///|
pub fn beat_of(meter : Meter, time : Int) -> Int {
  let length = meter.measure_length()
  let beat = meter.beat_length()
  if length <= 0 || beat <= 0 {
    0
  } else {
    time % length / beat
  }
}

///|
pub fn is_measure_boundary(meter : Meter, time : Int) -> Bool {
  let length = meter.measure_length()
  length > 0 && time % length == 0
}

///|
pub fn duration_histogram(notes : Array[Note]) -> Array[Int] {
  let result = Array::make(17, 0)
  for note in notes {
    let index = if note.duration < 0 {
      0
    } else if note.duration > 16 {
      16
    } else {
      note.duration
    }
    result[index] += 1
  }
  result
}

///|
pub fn onset_histogram(notes : Array[Note], period : Int) -> Array[Int] {
  let size = if period <= 0 { 1 } else { period }
  let result = Array::make(size, 0)
  for note in notes {
    let index = note.onset % size
    let safe_index = if index < 0 { index + size } else { index }
    result[safe_index] += 1
  }
  result
}

///|
pub fn gap_count(notes : Array[Note]) -> Int {
  if notes.length() < 2 {
    return 0
  }
  let mut result = 0
  for i in 1..<notes.length() {
    if notes[i].onset > note_end(notes[i - 1]) {
      result += 1
    }
  }
  result
}

///|
pub fn syncopation_count(meter : Meter, notes : Array[Note]) -> Int {
  let points = beat_points(meter, notes)
  let mut result = 0
  for i, note in notes {
    if i + 1 < notes.length() &&
      note_end(note) > notes[i + 1].onset &&
      is_accented(points[i]) &&
      is_weak(points[i + 1]) {
      result += 1
    }
  }
  result
}

///|
pub fn summarize_rhythm(meter : Meter, notes : Array[Note]) -> RhythmSummary {
  let points = beat_points(meter, notes)
  let mut downbeats = 0
  let mut offbeats = 0
  for point in points {
    if point.strength == Downbeat {
      downbeats += 1
    }
    if point.strength == Offbeat {
      offbeats += 1
    }
  }
  {
    notes: notes.length(),
    measures: if notes.length() == 0 {
      0
    } else {
      measure_of(meter, sequence_end(notes)) + 1
    },
    downbeats,
    offbeats,
    syncopations: syncopation_count(meter, notes),
    tied_notes: tied_count(notes),
    total_duration: total_sounding_duration(notes),
  }
}

///|
pub fn rhythm_density(meter : Meter, notes : Array[Note]) -> Int {
  let summary = summarize_rhythm(meter, notes)
  if summary.measures == 0 {
    0
  } else {
    summary.notes / summary.measures
  }
}

///|
pub fn duration_ratio(notes : Array[Note], duration : Int) -> Int {
  let total = notes.length()
  if total == 0 {
    0
  } else {
    count_duration(notes, duration) * 100 / total
  }
}
