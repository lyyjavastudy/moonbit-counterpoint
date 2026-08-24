///|
pub(all) struct PhraseWindow {
  index : Int
  start_index : Int
  end_index : Int
  start_time : Int
  end_time : Int
  note_count : Int
  pitch_range : Int
  density : Int
  anchor_beat : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PhrasePartition {
  windows : Array[PhraseWindow]
  total_notes : Int
  total_duration : Int
  window_duration : Int
} derive(Debug, Eq, ToJson)

///|
/// Divide a sequence into deterministic measure-sized windows for local analysis.
pub fn partition_phrases(
  notes : Array[Note],
  meter : Meter,
  measures_per_window : Int,
) -> PhrasePartition {
  let measure_length = meter.measure_length()
  let safe_measure = if measure_length <= 0 { 1 } else { measure_length }
  let safe_measures = if measures_per_window <= 0 {
    1
  } else {
    measures_per_window
  }
  let window_duration = safe_measure * safe_measures
  let total_duration = sequence_end(notes)
  let window_count = if total_duration <= 0 {
    0
  } else {
    (total_duration + window_duration - 1) / window_duration
  }
  let windows : Array[PhraseWindow] = []
  for window_index in 0..<window_count {
    let start_time = window_index * window_duration
    let end_time = if start_time + window_duration > total_duration {
      total_duration
    } else {
      start_time + window_duration
    }
    let start_index = first_note_index_at_or_after(notes, start_time)
    let end_index = first_note_index_at_or_after(notes, end_time)
    if start_index < end_index {
      windows.push(
        make_phrase_window(
          window_index, notes, start_index, end_index, start_time, end_time, meter,
        ),
      )
    }
  }
  { windows, total_notes: notes.length(), total_duration, window_duration }
}

///|
fn first_note_index_at_or_after(notes : Array[Note], time : Int) -> Int {
  for i, note in notes {
    if note.onset >= time {
      return i
    }
  }
  notes.length()
}

///|
fn make_phrase_window(
  index : Int,
  notes : Array[Note],
  start_index : Int,
  end_index : Int,
  start_time : Int,
  end_time : Int,
  meter : Meter,
) -> PhraseWindow {
  let first_pitch = notes[start_index].midi
  let mut lowest = first_pitch
  let mut highest = first_pitch
  for i in start_index..<end_index {
    let pitch = notes[i].midi
    if pitch < lowest {
      lowest = pitch
    }
    if pitch > highest {
      highest = pitch
    }
  }
  let count = end_index - start_index
  let duration = if end_time <= start_time { 1 } else { end_time - start_time }
  {
    index,
    start_index,
    end_index,
    start_time,
    end_time,
    note_count: count,
    pitch_range: highest - lowest,
    density: count * 100 / duration,
    anchor_beat: beat_label(beat_point(meter, start_time, start_index)),
  }
}

///|
pub fn phrase_window_count(partition : PhrasePartition) -> Int {
  partition.windows.length()
}

///|
pub fn phrase_window(partition : PhrasePartition, index : Int) -> PhraseWindow? {
  if index < 0 || index >= partition.windows.length() {
    None
  } else {
    Some(partition.windows[index])
  }
}

///|
pub fn phrase_window_contains(window : PhraseWindow, note_index : Int) -> Bool {
  note_index >= window.start_index && note_index < window.end_index
}

///|
pub fn phrase_window_duration(window : PhraseWindow) -> Int {
  window.end_time - window.start_time
}

///|
pub fn phrase_window_is_dense(window : PhraseWindow, threshold : Int) -> Bool {
  window.density >= threshold
}

///|
pub fn phrase_window_summary(window : PhraseWindow) -> String {
  "window=\{window.index} notes=\{window.note_count} range=\{window.pitch_range} density=\{window.density}% beat=\{window.anchor_beat}"
}

///|
pub fn phrase_partition_summary(partition : PhrasePartition) -> String {
  "windows=\{partition.windows.length()} notes=\{partition.total_notes} duration=\{partition.total_duration} window=\{partition.window_duration}"
}

///|
pub fn phrase_partition_markdown(partition : PhrasePartition) -> String {
  let lines : Array[String] = [
    "## Phrase windows",
    "",
    "- \{phrase_partition_summary(partition)}",
    "",
    "| Window | Notes | Range | Density | Anchor |",
    "| ---: | ---: | ---: | ---: | --- |",
  ]
  for window in partition.windows {
    lines.push(
      "| \{window.index} | \{window.note_count} | \{window.pitch_range} | \{window.density}% | \{window.anchor_beat} |",
    )
  }
  lines.join("\n")
}

///|
pub fn phrase_partition_boundaries(partition : PhrasePartition) -> Array[Int] {
  let result : Array[Int] = []
  for window in partition.windows {
    result.push(window.start_time)
  }
  result
}

///|
pub fn phrase_partition_for_meter(
  notes : Array[Note],
  meter : Meter,
) -> PhrasePartition {
  partition_phrases(notes, meter, 1)
}
