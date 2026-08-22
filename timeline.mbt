///|
pub(all) enum SequenceIssue {
  EmptySequence
  NegativePitch(index~ : Int)
  InvalidDuration(index~ : Int)
  NonMonotonicOnset(index~ : Int)
  Overlap(index~ : Int)
  DuplicateOnset(index~ : Int)
  ExcessiveGap(index~ : Int)
} derive(Debug, Eq, ToJson)

///|
pub(all) struct SequenceReport {
  note_count : Int
  duration : Int
  issues : Array[SequenceIssue]
} derive(Debug, Eq, ToJson)

///|
pub fn sequence_report(notes : Array[Note]) -> SequenceReport {
  let issues : Array[SequenceIssue] = []
  if notes.length() == 0 {
    issues.push(EmptySequence)
    return { note_count: 0, duration: 0, issues }
  }
  let mut end = 0
  for i, note in notes {
    if note.midi < 0 {
      issues.push(NegativePitch(index=i))
    }
    if note.duration <= 0 {
      issues.push(InvalidDuration(index=i))
    }
    if i > 0 {
      let previous = notes[i - 1]
      if note.onset < previous.onset {
        issues.push(NonMonotonicOnset(index=i))
      }
      if note.onset == previous.onset {
        issues.push(DuplicateOnset(index=i))
      }
      if note.onset < previous.onset + previous.duration {
        issues.push(Overlap(index=i))
      }
      if note.onset > previous.onset + previous.duration + 8 {
        issues.push(ExcessiveGap(index=i))
      }
    }
    if note.onset + note.duration > end {
      end = note.onset + note.duration
    }
  }
  { note_count: notes.length(), duration: end, issues }
}

///|
pub fn SequenceReport::is_valid(self : SequenceReport) -> Bool {
  self.issues.length() == 0
}

///|
pub fn SequenceReport::error_count(self : SequenceReport) -> Int {
  let mut total = 0
  for issue in self.issues {
    match issue {
      EmptySequence => total += 1
      InvalidDuration(_) => total += 1
      NegativePitch(_) => total += 1
      NonMonotonicOnset(_) => total += 1
      Overlap(_) => total += 1
      DuplicateOnset(_) => total += 1
      ExcessiveGap(_) => total += 1
    }
  }
  total
}

///|
pub fn note_end(note : Note) -> Int {
  note.onset + note.duration
}

///|
pub fn sequence_end(notes : Array[Note]) -> Int {
  let mut result = 0
  for note in notes {
    if note_end(note) > result {
      result = note_end(note)
    }
  }
  result
}

///|
pub fn notes_at(notes : Array[Note], onset : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    if note.onset == onset {
      result.push(note)
    }
  }
  result
}

///|
pub fn active_at(notes : Array[Note], time : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    if note.onset <= time && time < note_end(note) {
      result.push(note)
    }
  }
  result
}

///|
pub fn count_duration(notes : Array[Note], duration : Int) -> Int {
  let mut result = 0
  for note in notes {
    if note.duration == duration {
      result += 1
    }
  }
  result
}

///|
pub fn onset_span(notes : Array[Note]) -> Int {
  if notes.length() < 2 {
    return 0
  }
  let mut lowest = notes[0].onset
  let mut highest = notes[0].onset
  for note in notes {
    if note.onset < lowest {
      lowest = note.onset
    }
    if note.onset > highest {
      highest = note.onset
    }
  }
  highest - lowest
}

///|
pub fn total_sounding_duration(notes : Array[Note]) -> Int {
  let mut result = 0
  for note in notes {
    result += note.duration
  }
  result
}

///|
pub fn tied_count(notes : Array[Note]) -> Int {
  let mut result = 0
  for note in notes {
    if note.tied_from_previous {
      result += 1
    }
  }
  result
}

///|
pub fn first_pitch(notes : Array[Note]) -> Int? {
  if notes.length() == 0 {
    None
  } else {
    Some(notes[0].midi)
  }
}

///|
pub fn last_pitch(notes : Array[Note]) -> Int? {
  if notes.length() == 0 {
    None
  } else {
    Some(notes[notes.length() - 1].midi)
  }
}

///|
pub fn pitches(notes : Array[Note]) -> Array[Int] {
  let result : Array[Int] = []
  for note in notes {
    result.push(note.midi)
  }
  result
}

///|
pub fn transpose(notes : Array[Note], semitones : Int) -> Array[Note] {
  let result : Array[Note] = []
  for note in notes {
    result.push({ ..note, midi: note.midi + semitones })
  }
  result
}

///|
pub fn scale_time(notes : Array[Note], factor : Int) -> Array[Note] {
  let result : Array[Note] = []
  if factor <= 0 {
    return result
  }
  for note in notes {
    result.push({
      ..note,
      onset: note.onset * factor,
      duration: note.duration * factor,
    })
  }
  result
}
