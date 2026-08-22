///|
pub(all) struct NoteRow {
  midi : Int
  onset : Int
  duration : Int
  tied : Bool
  label : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct SequenceEnvelope {
  name : String
  meter : Meter
  notes : Array[NoteRow]
  version : String
} derive(Debug, Eq, ToJson)

///|
pub fn NoteRow::from_note(note : Note) -> NoteRow {
  {
    midi: note.midi,
    onset: note.onset,
    duration: note.duration,
    tied: note.tied_from_previous,
    label: note.label,
  }
}

///|
pub fn NoteRow::to_note(self : NoteRow) -> Note {
  Note::new(
    midi=self.midi,
    onset=self.onset,
    duration=self.duration,
    tied_from_previous=self.tied,
    label=self.label,
  )
}

///|
pub fn rows_from_notes(notes : Array[Note]) -> Array[NoteRow] {
  let result : Array[NoteRow] = []
  for note in notes {
    result.push(NoteRow::from_note(note))
  }
  result
}

///|
pub fn notes_from_rows(rows : Array[NoteRow]) -> Array[Note] {
  let result : Array[Note] = []
  for row in rows {
    result.push(row.to_note())
  }
  result
}

///|
fn escape_field(value : String) -> String {
  value
  .replace(old="\\", new="\\\\")
  .replace(old="\t", new="\\t")
  .replace(old="\n", new="\\n")
}

///|
pub fn unescape_field(value : String) -> String {
  value
  .replace(old="\\t", new="\t")
  .replace(old="\\n", new="\n")
  .replace(old="\\\\", new="\\")
}

///|
pub fn note_row_header() -> String {
  "midi\tonset\tduration\ttied\tlabel"
}

///|
pub fn note_row_to_line(row : NoteRow) -> String {
  "\{row.midi}\t\{row.onset}\t\{row.duration}\t\{row.tied}\t\{escape_field(row.label)}"
}

///|
pub fn notes_to_lines(notes : Array[Note]) -> Array[String] {
  let result : Array[String] = [note_row_header()]
  for row in rows_from_notes(notes) {
    result.push(note_row_to_line(row))
  }
  result
}

///|
pub fn notes_to_tsv(notes : Array[Note]) -> String {
  notes_to_lines(notes).join("\n")
}

///|
pub fn envelope(
  name : String,
  meter : Meter,
  notes : Array[Note],
) -> SequenceEnvelope {
  { name, meter, notes: rows_from_notes(notes), version: "1" }
}

///|
pub fn envelope_notes(value : SequenceEnvelope) -> Array[Note] {
  notes_from_rows(value.notes)
}

///|
pub fn envelope_summary(value : SequenceEnvelope) -> String {
  let notes = envelope_notes(value)
  "\{value.name}: \{notes.length()} notes, \{value.meter.numerator}/\{value.meter.denominator}"
}

///|
pub fn manifest(profile : RuleProfileConfig, meter : Meter) -> Array[String] {
  [
    "module=lyyjavastudy/moonbit-counterpoint",
    "profile=\{profile.label()}",
    "meter=\{meter.numerator}/\{meter.denominator}",
    "subdivision=\{meter.subdivision}",
    "format=counterpoint-tsv-v1",
  ]
}

///|
pub fn manifest_text(profile : RuleProfileConfig, meter : Meter) -> String {
  manifest(profile, meter).join("\n")
}

///|
pub fn analysis_manifest(analysis : Analysis) -> Array[String] {
  let summary = summarize(analysis)
  [
    "grade=\{summary.grade()}",
    "score=\{summary.score}",
    "total=\{summary.total}",
    "errors=\{summary.errors}",
    "warnings=\{summary.warnings}",
  ]
}

///|
pub fn analysis_manifest_text(analysis : Analysis) -> String {
  analysis_manifest(analysis).join("\n")
}

///|
pub fn pitch_rows(
  low : Int,
  high : Int,
  onset : Int,
  duration : Int,
) -> Array[NoteRow] {
  let result : Array[NoteRow] = []
  if low > high {
    return result
  }
  for midi in low..<=high {
    result.push({ midi, onset, duration, tied: false, label: pitch_label(midi) })
  }
  result
}

///|
pub fn notes_from_pitches(
  pitches_value : Array[Int],
  duration : Int,
) -> Array[Note] {
  let result : Array[Note] = []
  for i, midi in pitches_value {
    result.push(Note::new(midi~, onset=i * duration, duration~))
  }
  result
}

///|
pub fn notes_to_pitches(notes : Array[Note]) -> Array[Int] {
  pitches(notes)
}

///|
pub fn sequence_fingerprint(notes : Array[Note]) -> String {
  let parts : Array[String] = []
  for note in notes {
    parts.push("\{note.midi}:\{note.onset}:\{note.duration}")
  }
  parts.join("|")
}

///|
pub fn same_sequence(left : Array[Note], right : Array[Note]) -> Bool {
  if left.length() != right.length() {
    return false
  }
  for i in 0..<left.length() {
    if left[i] != right[i] {
      return false
    }
  }
  true
}

///|
pub fn shift_onsets(notes : Array[Note], delta : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    result.push({ ..note, onset: note.onset + delta })
  }
  result
}

///|
pub fn trim_before(notes : Array[Note], time : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    if note_end(note) > time {
      let onset = if note.onset < time { time } else { note.onset }
      let end = note_end(note)
      let duration = end - onset
      if duration > 0 {
        result.push({ ..note, onset, duration })
      }
    }
  }
  result
}

///|
pub fn trim_after(notes : Array[Note], time : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    if note.onset < time {
      let end = if note_end(note) > time { time } else { note_end(note) }
      let duration = end - note.onset
      if duration > 0 {
        result.push({ ..note, duration, })
      }
    }
  }
  result
}

///|
pub fn normalize_onsets(notes : Array[Note]) -> Array[Note] {
  if notes.length() == 0 {
    return []
  }
  let offset = notes[0].onset
  shift_onsets(notes, -offset)
}

///|
pub fn format_note_row(row : NoteRow) -> String {
  "\{pitch_label(row.midi)} @ \{row.onset}+\{row.duration}"
}

///|
pub fn format_sequence(notes : Array[Note]) -> String {
  let result : Array[String] = []
  for row in rows_from_notes(notes) {
    result.push(format_note_row(row))
  }
  result.join(", ")
}
