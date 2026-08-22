///|
pub(all) enum PitchClass {
  C
  Cs
  D
  Ds
  E
  F
  Fs
  G
  Gs
  A
  As
  B
} derive(Debug, Eq, ToJson)

///|
pub fn pitch_class(midi : Int) -> PitchClass {
  match interval_class(midi) {
    0 => C
    1 => Cs
    2 => D
    3 => Ds
    4 => E
    5 => F
    6 => Fs
    7 => G
    8 => Gs
    9 => A
    10 => As
    _ => B
  }
}

///|
pub fn pitch_class_name(pitch : PitchClass) -> String {
  match pitch {
    C => "C"
    Cs => "C#"
    D => "D"
    Ds => "D#"
    E => "E"
    F => "F"
    Fs => "F#"
    G => "G"
    Gs => "G#"
    A => "A"
    As => "A#"
    B => "B"
  }
}

///|
pub fn octave_number(midi : Int) -> Int {
  midi / 12 - 1
}

///|
pub fn pitch_label(midi : Int) -> String {
  "\{pitch_class_name(pitch_class(midi))}\{octave_number(midi)}"
}

///|
pub fn normalize_pitch(midi : Int, low : Int, high : Int) -> Int {
  if low > high {
    midi
  } else if midi < low {
    normalize_pitch(midi + 12, low, high)
  } else if midi > high {
    normalize_pitch(midi - 12, low, high)
  } else {
    midi
  }
}

///|
pub fn transpose_pitch_class(pitch : PitchClass, semitones : Int) -> PitchClass {
  let base = match pitch {
    C => 0
    Cs => 1
    D => 2
    Ds => 3
    E => 4
    F => 5
    Fs => 6
    G => 7
    Gs => 8
    A => 9
    As => 10
    B => 11
  }
  pitch_class(base + semitones)
}

///|
pub fn is_black_key(midi : Int) -> Bool {
  match pitch_class(midi) {
    Cs | Ds | Fs | Gs | As => true
    _ => false
  }
}

///|
pub fn is_extreme_register(midi : Int) -> Bool {
  midi < 36 || midi > 96
}

///|
pub fn note_with_pitch(note : Note, midi : Int) -> Note {
  { ..note, midi, }
}

///|
pub fn note_name(note : Note) -> String {
  if note.label == "" {
    pitch_label(note.midi)
  } else {
    note.label
  }
}

///|
pub fn semitone_distance(left : PitchClass, right : PitchClass) -> Int {
  let left_value = match left {
    C => 0
    Cs => 1
    D => 2
    Ds => 3
    E => 4
    F => 5
    Fs => 6
    G => 7
    Gs => 8
    A => 9
    As => 10
    B => 11
  }
  let right_value = match right {
    C => 0
    Cs => 1
    D => 2
    Ds => 3
    E => 4
    F => 5
    Fs => 6
    G => 7
    Gs => 8
    A => 9
    As => 10
    B => 11
  }
  interval_class(right_value - left_value)
}

///|
pub fn pitch_histogram(notes : Array[Note]) -> Array[Int] {
  let histogram = Array::make(12, 0)
  for note in notes {
    histogram[interval_class(note.midi)] += 1
  }
  histogram
}
