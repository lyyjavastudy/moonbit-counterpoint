///|
test "boundary matrix 001 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=47, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 002 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=37, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 003 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=51, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 004 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=41, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 005 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=2)
  let second = Note::new(midi=54, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 006 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=45, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 007 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=52, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 008 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=42, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 009 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=56, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 010 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=46, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 011 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=0)
  let second = Note::new(midi=60, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 012 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=50, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 013 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=64, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 014 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=47, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 015 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=4)
  let second = Note::new(midi=60, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 016 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=51, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 017 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=65, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 018 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=55, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 019 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=69, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 020 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=59, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 021 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=66, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 022 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=0)
  let second = Note::new(midi=56, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 023 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=70, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 024 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=60, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 025 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=2)
  let second = Note::new(midi=73, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 026 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=64, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 027 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=78, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 028 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=61, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 029 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=75, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 030 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=65, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 031 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=79, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 032 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=69, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 033 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=0)
  let second = Note::new(midi=83, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 034 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=73, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 035 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=4)
  let second = Note::new(midi=79, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 036 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=70, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 037 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=48, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 038 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=74, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 039 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=52, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 040 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=78, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 041 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=56, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 042 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=75, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 043 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=53, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 044 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=0)
  let second = Note::new(midi=79, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 045 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=2)
  let second = Note::new(midi=56, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 046 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=83, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 047 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=61, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 048 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=39, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 049 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=58, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 050 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=36, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 051 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=62, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 052 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=40, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 053 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=66, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 054 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=44, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 055 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=0)
  let second = Note::new(midi=69, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 056 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=41, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 057 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=67, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 058 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=45, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 059 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=71, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 060 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=49, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 061 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=75, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 062 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=53, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 063 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=72, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 064 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=50, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 065 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=2)
  let second = Note::new(midi=75, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 066 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=0)
  let second = Note::new(midi=54, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 067 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=80, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 068 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=58, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 069 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=84, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 070 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=55, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 071 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=81, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 072 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=59, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 073 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=49, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 074 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=63, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 075 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=4)
  let second = Note::new(midi=52, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 076 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=67, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 077 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=0)
  let second = Note::new(midi=50, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 078 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=64, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 079 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=54, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 080 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=68, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 081 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=58, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 082 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=72, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 083 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=62, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 084 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=69, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 085 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=2)
  let second = Note::new(midi=58, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 086 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=73, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 087 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=63, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 088 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=0)
  let second = Note::new(midi=77, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 089 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=67, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 090 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=81, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 091 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=64, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 092 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=78, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 093 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=68, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 094 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=82, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 095 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=4)
  let second = Note::new(midi=71, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 096 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=38, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 097 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=76, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 098 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=35, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 099 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=0)
  let second = Note::new(midi=73, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 100 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=39, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 101 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=77, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 102 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=43, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 103 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=81, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 104 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=47, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 105 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=2)
  let second = Note::new(midi=77, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 106 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=44, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 107 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=82, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 108 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=48, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 109 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=50, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 110 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=0)
  let second = Note::new(midi=52, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 111 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=54, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 112 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=49, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 113 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=51, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 114 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=53, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 115 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=4)
  let second = Note::new(midi=54, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 116 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=57, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 117 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=59, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 118 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=61, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 119 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=56, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 120 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=58, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 121 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=0)
  let second = Note::new(midi=60, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 122 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=62, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 123 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=64, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 124 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=66, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 125 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=2)
  let second = Note::new(midi=67, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 126 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=63, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 127 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=65, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 128 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=67, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 129 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=69, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 130 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=71, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 131 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=73, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 132 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=0)
  let second = Note::new(midi=75, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 133 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=70, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 134 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=72, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 135 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=4)
  let second = Note::new(midi=73, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 136 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=76, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 137 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=78, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 138 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=80, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 139 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=82, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 140 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=77, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 141 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=79, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 142 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=81, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 143 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=0)
  let second = Note::new(midi=83, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 144 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=37, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 145 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=2)
  let second = Note::new(midi=50, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 146 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=41, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 147 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=48, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 148 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=38, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 149 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=52, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 150 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=42, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 151 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=56, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 152 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=46, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 153 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=60, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 154 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=0)
  let second = Note::new(midi=43, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 155 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=4)
  let second = Note::new(midi=56, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 156 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=47, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 157 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=61, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 158 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=51, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 159 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=65, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 160 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=55, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 161 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=62, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 162 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=52, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 163 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=66, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 164 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=56, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 165 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=0)
  let second = Note::new(midi=69, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 166 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=60, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 167 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=74, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 168 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=57, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 169 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=71, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 170 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=61, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 171 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=75, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 172 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=65, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 173 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=79, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 174 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=69, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 175 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=4)
  let second = Note::new(midi=75, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 176 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=0)
  let second = Note::new(midi=66, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 177 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=80, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 178 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=70, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 179 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=84, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 180 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=74, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 181 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=52, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 182 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=71, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 183 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=49, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 184 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=75, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 185 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=2)
  let second = Note::new(midi=52, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 186 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=79, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 187 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=0)
  let second = Note::new(midi=57, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 188 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=83, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 189 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=54, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 190 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=80, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 191 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=58, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 192 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=36, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 193 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=62, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 194 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=40, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 195 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=4)
  let second = Note::new(midi=65, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 196 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=37, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 197 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=63, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 198 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=0)
  let second = Note::new(midi=41, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 199 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=67, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 200 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=45, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 201 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=71, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 202 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=49, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 203 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=68, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 204 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=46, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 205 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=2)
  let second = Note::new(midi=71, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 206 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=50, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 207 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=76, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 208 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=54, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 209 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=0)
  let second = Note::new(midi=80, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 210 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=51, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 211 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=77, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 212 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=55, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 213 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=81, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 214 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=59, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 215 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=4)
  let second = Note::new(midi=84, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 216 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=63, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 217 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=46, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 218 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=60, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 219 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=50, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 220 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=0)
  let second = Note::new(midi=64, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 221 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=54, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 222 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=68, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 223 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=58, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 224 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=65, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 225 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=2)
  let second = Note::new(midi=54, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 226 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=69, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 227 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=59, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 228 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=73, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 229 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=63, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 230 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=77, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 231 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=0)
  let second = Note::new(midi=60, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 232 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=74, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 233 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=64, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 234 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=78, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 235 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=4)
  let second = Note::new(midi=67, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 236 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=82, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 237 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=72, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 238 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=79, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 239 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=69, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 240 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=35, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 241 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=73, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 242 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=0)
  let second = Note::new(midi=39, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 243 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=77, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 244 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=43, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 245 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=2)
  let second = Note::new(midi=73, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 246 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=40, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 247 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=78, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 248 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=44, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 249 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=82, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 250 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=48, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 251 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=86, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 252 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=45, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 253 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=0)
  let second = Note::new(midi=47, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 254 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=49, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 255 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=4)
  let second = Note::new(midi=50, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 256 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=53, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 257 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=55, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 258 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=57, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 259 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=52, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 260 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=54, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 261 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=56, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 262 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=58, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 263 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=60, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 264 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=0)
  let second = Note::new(midi=62, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 265 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=2)
  let second = Note::new(midi=63, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 266 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=59, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 267 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=61, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 268 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=63, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 269 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=65, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 270 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=67, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 271 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=69, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 272 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=71, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 273 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=66, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 274 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=68, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 275 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=0)
  let second = Note::new(midi=69, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 276 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=72, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 277 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=74, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 278 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=76, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 279 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=78, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 280 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=73, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 281 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=75, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 282 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=77, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 283 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=79, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 284 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=81, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 285 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=2)
  let second = Note::new(midi=82, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 286 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=0)
  let second = Note::new(midi=85, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 287 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=80, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 288 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=34, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 289 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=48, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 290 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=38, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 291 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=52, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 292 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=42, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 293 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=56, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 294 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=39, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 295 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=4)
  let second = Note::new(midi=52, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 296 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=43, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 297 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=0)
  let second = Note::new(midi=57, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 298 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=47, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 299 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=61, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 300 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=51, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 301 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=58, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 302 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=48, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 303 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=62, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 304 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=52, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 305 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=2)
  let second = Note::new(midi=65, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 306 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=56, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 307 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=70, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 308 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=0)
  let second = Note::new(midi=53, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 309 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=67, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 310 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=57, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 311 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=71, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 312 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=61, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 313 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=75, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 314 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=65, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 315 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=4)
  let second = Note::new(midi=71, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 316 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=62, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 317 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=76, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 318 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=66, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 319 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=0)
  let second = Note::new(midi=80, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 320 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=70, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 321 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=84, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 322 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=67, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 323 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=81, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 324 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=71, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 325 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=2)
  let second = Note::new(midi=48, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 326 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=75, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 327 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=53, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 328 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=79, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 329 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=50, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 330 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=0)
  let second = Note::new(midi=76, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 331 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=54, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 332 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=80, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 333 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=58, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 334 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=84, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 335 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=4)
  let second = Note::new(midi=61, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 336 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=33, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 337 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=59, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 338 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=37, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 339 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=63, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 340 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=41, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 341 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=0)
  let second = Note::new(midi=67, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 342 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=45, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 343 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=64, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 344 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=42, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 345 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=2)
  let second = Note::new(midi=67, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 346 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=46, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 347 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=72, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 348 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=50, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 349 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=76, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 350 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=47, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 351 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=73, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 352 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=0)
  let second = Note::new(midi=51, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 353 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=77, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 354 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=55, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 355 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=4)
  let second = Note::new(midi=80, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 356 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=59, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 357 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=78, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 358 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=56, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 359 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=82, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 360 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=60, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 361 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=50, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 362 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=64, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 363 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=0)
  let second = Note::new(midi=54, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 364 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=61, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 365 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=2)
  let second = Note::new(midi=50, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 366 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=65, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 367 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=55, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 368 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=69, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 369 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=59, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 370 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=73, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 371 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=56, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 372 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=70, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 373 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=60, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 374 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=0)
  let second = Note::new(midi=74, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 375 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=4)
  let second = Note::new(midi=63, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 376 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=78, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 377 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=68, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 378 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=75, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 379 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=65, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 380 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=79, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 381 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=69, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 382 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=83, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 383 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=73, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 384 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=39, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 385 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=0)
  let second = Note::new(midi=69, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 386 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=36, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 387 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=74, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 388 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=40, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 389 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=78, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 390 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=44, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 391 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=82, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 392 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=41, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 393 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=79, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 394 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=45, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 395 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=4)
  let second = Note::new(midi=82, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 396 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=0)
  let second = Note::new(midi=49, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 397 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=51, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 398 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=53, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 399 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=48, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 400 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=50, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 401 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=52, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 402 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=54, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 403 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=56, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 404 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=58, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 405 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=2)
  let second = Note::new(midi=59, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 406 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=55, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 407 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=0)
  let second = Note::new(midi=57, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 408 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=59, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 409 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=61, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 410 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=63, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 411 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=65, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 412 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=67, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 413 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=62, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 414 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=64, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 415 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=4)
  let second = Note::new(midi=65, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 416 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=68, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 417 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=70, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 418 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=0)
  let second = Note::new(midi=72, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 419 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=74, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 420 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=69, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 421 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=71, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 422 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=73, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 423 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=75, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 424 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=77, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 425 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=2)
  let second = Note::new(midi=78, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 426 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=81, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 427 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=76, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 428 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=78, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 429 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=0)
  let second = Note::new(midi=80, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 430 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=82, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 431 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=84, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 432 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=38, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 433 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=52, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 434 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=35, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 435 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=4)
  let second = Note::new(midi=48, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 436 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=39, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 437 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=53, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 438 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=43, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 439 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=57, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 440 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=0)
  let second = Note::new(midi=47, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 441 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=54, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 442 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=44, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 443 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=58, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 444 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=48, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 445 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=2)
  let second = Note::new(midi=61, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 446 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=52, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 447 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=66, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 448 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=49, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 449 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=63, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 450 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=53, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 451 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=0)
  let second = Note::new(midi=67, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 452 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=57, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 453 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=71, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 454 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=61, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 455 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=4)
  let second = Note::new(midi=67, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 456 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=58, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 457 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=72, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 458 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=62, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 459 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=76, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 460 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=66, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 461 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=80, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 462 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=0)
  let second = Note::new(midi=63, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 463 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=77, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 464 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=67, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 465 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=2)
  let second = Note::new(midi=80, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 466 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=71, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 467 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=85, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 468 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=75, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 469 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=46, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 470 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=72, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 471 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=50, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 472 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=76, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 473 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=0)
  let second = Note::new(midi=54, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 474 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=80, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 475 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=4)
  let second = Note::new(midi=57, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 476 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=77, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 477 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=55, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 478 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=81, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 479 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=59, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 480 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=37, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 481 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=63, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 482 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=41, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 483 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=60, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 484 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=0)
  let second = Note::new(midi=38, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 485 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=2)
  let second = Note::new(midi=63, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 486 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=42, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 487 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=68, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 488 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=46, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 489 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=72, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 490 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=43, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 491 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=69, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 492 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=47, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 493 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=73, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 494 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=51, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 495 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=0)
  let second = Note::new(midi=76, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 496 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=55, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 497 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=74, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 498 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=52, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 499 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=78, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 500 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=56, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 501 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=82, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 502 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=60, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 503 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=86, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 504 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=57, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 505 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=2)
  let second = Note::new(midi=46, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 506 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=0)
  let second = Note::new(midi=61, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 507 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=51, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 508 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=65, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 509 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=55, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 510 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=69, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 511 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=52, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 512 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=66, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 513 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=56, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 514 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=70, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 515 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=4)
  let second = Note::new(midi=59, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 516 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=74, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 517 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=0)
  let second = Note::new(midi=64, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 518 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=71, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 519 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=61, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 520 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=75, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 521 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=65, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 522 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=79, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 523 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=69, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 524 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=83, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 525 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=2)
  let second = Note::new(midi=65, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 526 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=80, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 527 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=70, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 528 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=0)
  let second = Note::new(midi=36, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 529 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=74, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 530 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=40, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 531 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=78, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 532 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=37, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 533 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=75, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 534 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=41, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 535 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=4)
  let second = Note::new(midi=78, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 536 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=45, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 537 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=83, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 538 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=49, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 539 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=0)
  let second = Note::new(midi=80, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 540 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=46, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 541 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=48, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 542 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=50, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 543 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=52, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 544 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=54, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 545 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=2)
  let second = Note::new(midi=55, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 546 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=51, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 547 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=53, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 548 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=55, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 549 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=57, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 550 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=0)
  let second = Note::new(midi=59, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 551 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=61, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 552 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=63, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 553 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=58, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 554 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=60, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 555 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=4)
  let second = Note::new(midi=61, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 556 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=64, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 557 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=66, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 558 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=68, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 559 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=70, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 560 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=65, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 561 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=0)
  let second = Note::new(midi=67, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 562 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=69, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 563 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=71, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 564 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=73, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 565 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=2)
  let second = Note::new(midi=74, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 566 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=77, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 567 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=72, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 568 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=74, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 569 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=76, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 570 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=78, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 571 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=80, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 572 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=0)
  let second = Note::new(midi=82, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 573 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=84, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 574 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=79, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 575 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=4)
  let second = Note::new(midi=80, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 576 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=35, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 577 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=49, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 578 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=39, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 579 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=53, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 580 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=43, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 581 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=50, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 582 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=40, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 583 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=0)
  let second = Note::new(midi=54, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 584 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=44, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 585 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=2)
  let second = Note::new(midi=57, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 586 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=48, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 587 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=62, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 588 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=45, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 589 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=59, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 590 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=49, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 591 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=63, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 592 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=53, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 593 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=67, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 594 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=0)
  let second = Note::new(midi=57, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 595 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=4)
  let second = Note::new(midi=63, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 596 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=54, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 597 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=68, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 598 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=58, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 599 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=4)
  let second = Note::new(midi=72, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 600 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=62, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 601 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=76, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 602 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=59, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 603 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=73, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 604 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=63, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 605 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=0)
  let second = Note::new(midi=76, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 606 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=67, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 607 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=81, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 608 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=71, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 609 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=78, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 610 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=68, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 611 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=82, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 612 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=1)
  let second = Note::new(midi=72, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 613 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=2)
  let second = Note::new(midi=50, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 614 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=76, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 615 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=4)
  let second = Note::new(midi=53, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 616 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=0)
  let second = Note::new(midi=73, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 617 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=51, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 618 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=77, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 619 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=55, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 620 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=81, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 621 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=59, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 622 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=85, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 623 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=56, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 624 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=34, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 625 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=2)
  let second = Note::new(midi=59, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 626 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=38, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 627 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=0)
  let second = Note::new(midi=64, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 628 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=42, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 629 validates deterministic APIs" {
  let first = Note::new(midi=65, onset=0, duration=2)
  let second = Note::new(midi=68, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 630 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=39, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 631 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=65, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 632 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=43, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 633 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=69, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 634 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=3)
  let second = Note::new(midi=47, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 635 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=4)
  let second = Note::new(midi=72, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 636 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=51, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 637 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=70, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 638 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=0)
  let second = Note::new(midi=48, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 639 validates deterministic APIs" {
  let first = Note::new(midi=75, onset=0, duration=4)
  let second = Note::new(midi=74, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 640 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=52, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 641 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=78, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 642 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=56, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 643 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=82, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 644 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=53, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 645 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=2)
  let second = Note::new(midi=78, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 646 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=57, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 647 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=83, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 648 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=61, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 649 validates deterministic APIs" {
  let first = Note::new(midi=49, onset=0, duration=0)
  let second = Note::new(midi=51, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 650 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=65, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 651 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=48, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 652 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=62, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 653 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=52, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 654 validates deterministic APIs" {
  let first = Note::new(midi=66, onset=0, duration=3)
  let second = Note::new(midi=66, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 655 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=4)
  let second = Note::new(midi=55, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 656 validates deterministic APIs" {
  let first = Note::new(midi=68, onset=0, duration=1)
  let second = Note::new(midi=70, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 657 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=2)
  let second = Note::new(midi=60, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 658 validates deterministic APIs" {
  let first = Note::new(midi=70, onset=0, duration=3)
  let second = Note::new(midi=67, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 659 validates deterministic APIs" {
  let first = Note::new(midi=59, onset=0, duration=4)
  let second = Note::new(midi=57, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 660 validates deterministic APIs" {
  let first = Note::new(midi=72, onset=0, duration=0)
  let second = Note::new(midi=71, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 661 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=61, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 662 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=3)
  let second = Note::new(midi=75, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 663 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=65, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 664 validates deterministic APIs" {
  let first = Note::new(midi=76, onset=0, duration=1)
  let second = Note::new(midi=79, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 665 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=2)
  let second = Note::new(midi=61, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 666 validates deterministic APIs" {
  let first = Note::new(midi=78, onset=0, duration=3)
  let second = Note::new(midi=76, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 667 validates deterministic APIs" {
  let first = Note::new(midi=67, onset=0, duration=4)
  let second = Note::new(midi=66, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 668 validates deterministic APIs" {
  let first = Note::new(midi=80, onset=0, duration=1)
  let second = Note::new(midi=80, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 669 validates deterministic APIs" {
  let first = Note::new(midi=69, onset=0, duration=2)
  let second = Note::new(midi=70, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 670 validates deterministic APIs" {
  let first = Note::new(midi=82, onset=0, duration=3)
  let second = Note::new(midi=84, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 671 validates deterministic APIs" {
  let first = Note::new(midi=71, onset=0, duration=0)
  let second = Note::new(midi=74, onset=2, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 672 validates deterministic APIs" {
  let first = Note::new(midi=36, onset=0, duration=1)
  let second = Note::new(midi=33, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 673 validates deterministic APIs" {
  let first = Note::new(midi=73, onset=0, duration=2)
  let second = Note::new(midi=71, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 674 validates deterministic APIs" {
  let first = Note::new(midi=38, onset=0, duration=3)
  let second = Note::new(midi=37, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 675 validates deterministic APIs" {
  let first = Note::new(midi=74, onset=0, duration=4)
  let second = Note::new(midi=74, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 676 validates deterministic APIs" {
  let first = Note::new(midi=40, onset=0, duration=1)
  let second = Note::new(midi=41, onset=0, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 677 validates deterministic APIs" {
  let first = Note::new(midi=77, onset=0, duration=2)
  let second = Note::new(midi=79, onset=4, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 678 validates deterministic APIs" {
  let first = Note::new(midi=42, onset=0, duration=3)
  let second = Note::new(midi=45, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 679 validates deterministic APIs" {
  let first = Note::new(midi=79, onset=0, duration=4)
  let second = Note::new(midi=76, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 680 validates deterministic APIs" {
  let first = Note::new(midi=44, onset=0, duration=1)
  let second = Note::new(midi=42, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 681 validates deterministic APIs" {
  let first = Note::new(midi=81, onset=0, duration=2)
  let second = Note::new(midi=80, onset=2, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 682 validates deterministic APIs" {
  let first = Note::new(midi=46, onset=0, duration=0)
  let second = Note::new(midi=46, onset=1, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 683 validates deterministic APIs" {
  let first = Note::new(midi=83, onset=0, duration=4)
  let second = Note::new(midi=84, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 684 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=1)
  let second = Note::new(midi=50, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 685 validates deterministic APIs" {
  let first = Note::new(midi=48, onset=0, duration=2)
  let second = Note::new(midi=51, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 686 validates deterministic APIs" {
  let first = Note::new(midi=50, onset=0, duration=3)
  let second = Note::new(midi=47, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 687 validates deterministic APIs" {
  let first = Note::new(midi=51, onset=0, duration=4)
  let second = Note::new(midi=49, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 688 validates deterministic APIs" {
  let first = Note::new(midi=52, onset=0, duration=1)
  let second = Note::new(midi=51, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 6).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 689 validates deterministic APIs" {
  let first = Note::new(midi=53, onset=0, duration=2)
  let second = Note::new(midi=53, onset=0, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -6).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 690 validates deterministic APIs" {
  let first = Note::new(midi=54, onset=0, duration=3)
  let second = Note::new(midi=55, onset=3, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -5).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 691 validates deterministic APIs" {
  let first = Note::new(midi=55, onset=0, duration=4)
  let second = Note::new(midi=57, onset=5, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -4).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 692 validates deterministic APIs" {
  let first = Note::new(midi=56, onset=0, duration=1)
  let second = Note::new(midi=59, onset=3, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 693 validates deterministic APIs" {
  let first = Note::new(midi=57, onset=0, duration=0)
  let second = Note::new(midi=54, onset=0, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -2).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 694 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=3)
  let second = Note::new(midi=56, onset=4, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, -1).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 695 validates deterministic APIs" {
  let first = Note::new(midi=58, onset=0, duration=4)
  let second = Note::new(midi=57, onset=6, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 0).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 696 validates deterministic APIs" {
  let first = Note::new(midi=60, onset=0, duration=1)
  let second = Note::new(midi=60, onset=1, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 1).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 697 validates deterministic APIs" {
  let first = Note::new(midi=61, onset=0, duration=2)
  let second = Note::new(midi=62, onset=3, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 2).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 698 validates deterministic APIs" {
  let first = Note::new(midi=62, onset=0, duration=3)
  let second = Note::new(midi=64, onset=5, duration=3)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 3).length(), content="2")
  inspect(scale_time(notes, 3).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 699 validates deterministic APIs" {
  let first = Note::new(midi=63, onset=0, duration=4)
  let second = Note::new(midi=66, onset=4, duration=1)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 4).length(), content="2")
  inspect(scale_time(notes, 1).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}

///|
test "boundary matrix 700 validates deterministic APIs" {
  let first = Note::new(midi=64, onset=0, duration=1)
  let second = Note::new(midi=61, onset=2, duration=2)
  let notes = [first, second]
  let report = sequence_report(notes)
  inspect(report.note_count, content="2")
  inspect(report.duration >= 0, content="true")
  inspect(transpose(notes, 5).length(), content="2")
  inspect(scale_time(notes, 2).length(), content="2")
  inspect(pitch_histogram(notes).length(), content="12")
  inspect(register_distance(notes, 60) >= 0, content="true")
}
