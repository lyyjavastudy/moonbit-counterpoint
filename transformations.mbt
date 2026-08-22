///|
pub(all) enum TransformationKind {
  Transpose
  Invert
  Retrograde
  Stretch
  Compress
  Rotate
} derive(Debug, Eq, ToJson)

///|
pub(all) struct Transformation {
  kind : TransformationKind
  amount : Int
  description : String
} derive(Debug, Eq, ToJson)

///|
pub fn transformation_name(kind : TransformationKind) -> String {
  match kind {
    Transpose => "transpose"
    Invert => "invert"
    Retrograde => "retrograde"
    Stretch => "stretch"
    Compress => "compress"
    Rotate => "rotate"
  }
}

///|
pub fn transpose_sequence(notes : Array[Note], semitones : Int) -> Array[Note] {
  transpose(notes, semitones)
}

///|
pub fn invert_sequence(notes : Array[Note], axis : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    result.push({
      ..note,
      midi: axis * 2 - note.midi,
      label: pitch_label(axis * 2 - note.midi),
    })
  }
  result
}

///|
pub fn retrograde_sequence(notes : Array[Note]) -> Array[Note] {
  let result : Array[Note] = []
  let total = sequence_end(notes)
  for i in 0..<notes.length() {
    let note = notes[notes.length() - i - 1]
    result.push({ ..note, onset: total - note_end(note) })
  }
  result
}

///|
pub fn rotate_sequence(notes : Array[Note], amount : Int) -> Array[Note] {
  let result : Array[Note] = []
  if notes.length() == 0 {
    return result
  }
  let offset = (amount % notes.length() + notes.length()) % notes.length()
  for i in 0..<notes.length() {
    result.push(notes[(i + offset) % notes.length()])
  }
  normalize_onsets(result)
}

///|
pub fn stretch_sequence(notes : Array[Note], factor : Int) -> Array[Note] {
  scale_time(notes, if factor <= 0 { 1 } else { factor })
}

///|
pub fn compress_sequence(notes : Array[Note], factor : Int) -> Array[Note] {
  if factor <= 0 {
    return notes
  }
  let result : Array[Note] = []
  for note in notes {
    result.push({
      ..note,
      onset: note.onset / factor,
      duration: if note.duration / factor <= 0 {
        1
      } else {
        note.duration / factor
      },
    })
  }
  result
}

///|
pub fn apply_transformation(
  notes : Array[Note],
  transformation : Transformation,
) -> Array[Note] {
  match transformation.kind {
    Transpose => transpose_sequence(notes, transformation.amount)
    Invert => invert_sequence(notes, transformation.amount)
    Retrograde => retrograde_sequence(notes)
    Stretch => stretch_sequence(notes, transformation.amount)
    Compress => compress_sequence(notes, transformation.amount)
    Rotate => rotate_sequence(notes, transformation.amount)
  }
}

///|
pub fn transformation_description(value : Transformation) -> String {
  "\{transformation_name(value.kind)}(\{value.amount}): \{value.description}"
}

///|
pub fn transformation_round_trip(notes : Array[Note], semitones : Int) -> Bool {
  same_sequence(
    notes,
    transpose_sequence(transpose_sequence(notes, semitones), -semitones),
  )
}

///|
pub fn contour_preserved_after_transpose(
  notes : Array[Note],
  semitones : Int,
) -> Bool {
  compare_contours(notes, transpose_sequence(notes, semitones)) == 0
}

///|
pub fn interval_profile(notes : Array[Note]) -> Array[Int] {
  let result : Array[Int] = []
  if notes.length() < 2 {
    return result
  }
  for i in 1..<notes.length() {
    result.push(melodic_interval(notes[i - 1], notes[i]))
  }
  result
}

///|
pub fn same_interval_profile(left : Array[Note], right : Array[Note]) -> Bool {
  interval_profile(left) == interval_profile(right)
}

///|
pub fn transformation_catalog() -> Array[Transformation] {
  [
    {
      kind: Transpose,
      amount: 0,
      description: "move the phrase without changing intervals",
    },
    {
      kind: Invert,
      amount: 60,
      description: "reflect pitches around a register axis",
    },
    {
      kind: Retrograde,
      amount: 0,
      description: "reverse event order while preserving durations",
    },
    {
      kind: Stretch,
      amount: 2,
      description: "double event times for a slower exercise",
    },
    {
      kind: Compress,
      amount: 2,
      description: "halve event times for a faster exercise",
    },
    { kind: Rotate, amount: 1, description: "start from the next event" },
  ]
}

///|
pub fn transformation_examples(notes : Array[Note]) -> Array[String] {
  let result : Array[String] = []
  for transformation in transformation_catalog() {
    let output = apply_transformation(notes, transformation)
    result.push(
      "\{transformation_name(transformation.kind)}:\{sequence_fingerprint(output)}",
    )
  }
  result
}

///|
pub fn transformation_is_safe(transformation : Transformation) -> Bool {
  match transformation.kind {
    Transpose => transformation.amount >= -127 && transformation.amount <= 127
    Invert => transformation.amount >= 0 && transformation.amount <= 127
    Retrograde => true
    Stretch | Compress => transformation.amount > 0
    Rotate => true
  }
}

///|
pub fn safe_transformations() -> Array[Transformation] {
  let result : Array[Transformation] = []
  for transformation in transformation_catalog() {
    if transformation_is_safe(transformation) {
      result.push(transformation)
    }
  }
  result
}

///|
pub fn transformation_count() -> Int {
  safe_transformations().length()
}
