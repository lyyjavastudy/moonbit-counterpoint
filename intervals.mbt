///|
fn abs_int(x : Int) -> Int {
  if x < 0 {
    -x
  } else {
    x
  }
}

///|
pub fn melodic_interval(a : Note, b : Note) -> Int {
  b.midi - a.midi
}

///|
pub fn harmonic_interval(lower : Note, upper : Note) -> Int {
  upper.midi - lower.midi
}

///|
pub fn interval_class(semitones : Int) -> Int {
  let v = semitones % 12
  if v < 0 {
    v + 12
  } else {
    v
  }
}

///|
pub fn is_perfect_consonance(semitones : Int) -> Bool {
  let pc = interval_class(semitones)
  pc == 0 || pc == 7
}

///|
pub fn is_imperfect_consonance(semitones : Int) -> Bool {
  let pc = interval_class(semitones)
  pc == 3 || pc == 4 || pc == 8 || pc == 9
}

///|
pub fn is_consonance(semitones : Int) -> Bool {
  is_perfect_consonance(semitones) || is_imperfect_consonance(semitones)
}

///|
pub fn is_dissonance(semitones : Int) -> Bool {
  !is_consonance(semitones)
}

///|
pub fn direction(a : Note, b : Note) -> Direction {
  if b.midi > a.midi {
    Up
  } else if b.midi < a.midi {
    Down
  } else {
    Same
  }
}

///|
pub fn motion(
  cantus_a : Note,
  cantus_b : Note,
  counter_a : Note,
  counter_b : Note,
) -> MotionKind {
  let c = direction(cantus_a, cantus_b)
  let p = direction(counter_a, counter_b)
  if c == Same && p == Same {
    Static
  } else if c == Same || p == Same {
    Oblique
  } else if c == p {
    let old_interval = harmonic_interval(cantus_a, counter_a)
    let new_interval = harmonic_interval(cantus_b, counter_b)
    if interval_class(old_interval) == interval_class(new_interval) {
      Parallel
    } else {
      Similar
    }
  } else {
    Contrary
  }
}

///|
pub fn absolute_melodic_interval(a : Note, b : Note) -> Int {
  abs_int(melodic_interval(a, b))
}
