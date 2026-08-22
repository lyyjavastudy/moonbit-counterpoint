///|
pub fn analyze_batch(
  cantus : Array[Note],
  variants : Array[Array[Note]],
  profile : RuleProfileConfig,
) -> Array[AnalysisSummary] {
  let result : Array[AnalysisSummary] = []
  for counter in variants {
    result.push(summarize(analyze_with_profile(cantus, counter, profile)))
  }
  result
}

///|
pub fn best_variant(
  cantus : Array[Note],
  variants : Array[Array[Note]],
  profile : RuleProfileConfig,
) -> Array[Note]? {
  if variants.length() == 0 {
    return None
  }
  let mut best = variants[0]
  let mut best_score = score_for(
    analyze_with_profile(cantus, best, profile),
    profile,
  )
  for variant in variants {
    let score = score_for(
      analyze_with_profile(cantus, variant, profile),
      profile,
    )
    if score > best_score {
      best = variant
      best_score = score
    }
  }
  Some(best)
}

///|
pub fn filter_by_range(
  notes : Array[Note],
  low : Int,
  high : Int,
) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    if low <= note.midi && note.midi <= high {
      result.push(note)
    }
  }
  result
}

///|
pub fn filter_by_duration(notes : Array[Note], duration : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    if note.duration == duration {
      result.push(note)
    }
  }
  result
}

///|
pub fn filter_by_beat(
  meter : Meter,
  notes : Array[Note],
  strength : BeatStrength,
) -> Array[Note] {
  let result : Array[Note] = []
  for i, point in beat_points(meter, notes) {
    if point.strength == strength {
      result.push(notes[i])
    }
  }
  result
}

///|
pub fn merge_sequences(left : Array[Note], right : Array[Note]) -> Array[Note] {
  let result : Array[Note] = []
  for note in left {
    result.push(note)
  }
  for note in right {
    result.push(note)
  }
  result
}

///|
pub fn notes_with_labels(notes : Array[Note]) -> Array[String] {
  let result : Array[String] = []
  for note in notes {
    result.push(note_name(note))
  }
  result
}

///|
pub fn labels_text(notes : Array[Note]) -> String {
  notes_with_labels(notes).join(" ")
}

///|
pub fn event_count_between(notes : Array[Note], start : Int, end : Int) -> Int {
  let mut result = 0
  for note in notes {
    if start <= note.onset && note.onset < end {
      result += 1
    }
  }
  result
}

///|
pub fn duration_between(notes : Array[Note], start : Int, end : Int) -> Int {
  let mut result = 0
  for note in notes {
    let left = if note.onset < start { start } else { note.onset }
    let right = if note_end(note) > end { end } else { note_end(note) }
    if right > left {
      result += right - left
    }
  }
  result
}

///|
pub fn note_indices(notes : Array[Note]) -> Array[Int] {
  let result : Array[Int] = []
  for i in 0..<notes.length() {
    result.push(i)
  }
  result
}

///|
pub fn note_at_index(notes : Array[Note], index : Int) -> Note? {
  if index < 0 || index >= notes.length() {
    None
  } else {
    Some(notes[index])
  }
}

///|
pub fn replace_note(
  notes : Array[Note],
  index : Int,
  replacement : Note,
) -> Array[Note] {
  let result = notes.copy()
  if index >= 0 && index < result.length() {
    result[index] = replacement
  }
  result
}

///|
pub fn replace_pitch(
  notes : Array[Note],
  index : Int,
  midi : Int,
) -> Array[Note] {
  match note_at_index(notes, index) {
    None => notes
    Some(note) => replace_note(notes, index, note_with_pitch(note, midi))
  }
}

///|
pub fn edit_distance(left : Array[Note], right : Array[Note]) -> Int {
  let n = if left.length() < right.length() {
    left.length()
  } else {
    right.length()
  }
  let mut distance = if left.length() > right.length() {
    left.length() - right.length()
  } else {
    right.length() - left.length()
  }
  for i in 0..<n {
    if left[i].midi != right[i].midi {
      distance += 1
    }
    if left[i].duration != right[i].duration {
      distance += 1
    }
  }
  distance
}

///|
pub fn pitch_edit_distance(left : Array[Note], right : Array[Note]) -> Int {
  let n = if left.length() < right.length() {
    left.length()
  } else {
    right.length()
  }
  let mut distance = if left.length() > right.length() {
    left.length() - right.length()
  } else {
    right.length() - left.length()
  }
  for i in 0..<n {
    distance += absolute_melodic_interval(left[i], right[i])
  }
  distance
}

///|
pub fn normalize_phrase(
  notes : Array[Note],
  low : Int,
  high : Int,
) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    result.push(note_with_pitch(note, normalize_pitch(note.midi, low, high)))
  }
  result
}

///|
pub fn api_health(notes : Array[Note], meter : Meter) -> Bool {
  sequence_report(notes).is_valid() &&
  meter.is_valid() &&
  pitch_statistics(notes).count == notes.length()
}

///|
pub fn api_health_message(notes : Array[Note], meter : Meter) -> String {
  if api_health(notes, meter) {
    "input is ready for analysis"
  } else {
    "input requires normalization or timeline repair"
  }
}
