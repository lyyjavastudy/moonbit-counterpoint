///|
pub(all) struct PitchStatistics {
  count : Int
  minimum : Int
  maximum : Int
  mean : Int
  median : Int
  range : Int
  distinct : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct IntervalStatistics {
  count : Int
  minimum : Int
  maximum : Int
  mean : Int
  steps : Int
  leaps : Int
  repeated : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PairStatistics {
  aligned : Int
  contrary : Int
  parallel : Int
  similar : Int
  oblique : Int
  static_motion : Int
  average_vertical : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct RegisterBand {
  low : Int
  high : Int
  count : Int
  percentage : Int
} derive(Debug, Eq, ToJson)

///|
fn insertion_index(values : Array[Int], value : Int) -> Int {
  let mut result = 0
  for current in values {
    if current <= value {
      result += 1
    }
  }
  result
}

///|
fn sorted_copy(values : Array[Int]) -> Array[Int] {
  let result : Array[Int] = []
  for value in values {
    let index = insertion_index(result, value)
    result.push(value)
    let mut i = result.length() - 1
    while i > index {
      result[i] = result[i - 1]
      i -= 1
    }
    result[index] = value
  }
  result
}

///|
pub fn pitch_statistics(notes : Array[Note]) -> PitchStatistics {
  if notes.length() == 0 {
    return {
      count: 0,
      minimum: 0,
      maximum: 0,
      mean: 0,
      median: 0,
      range: 0,
      distinct: 0,
    }
  }
  let values = pitches(notes)
  let sorted = sorted_copy(values)
  let mut low = sorted[0]
  let mut high = sorted[sorted.length() - 1]
  let mut sum = 0
  let mut distinct = 0
  for i, value in sorted {
    if value < low {
      low = value
    }
    if value > high {
      high = value
    }
    sum += value
    if i == 0 || value != sorted[i - 1] {
      distinct += 1
    }
  }
  let middle = sorted.length() / 2
  {
    count: sorted.length(),
    minimum: low,
    maximum: high,
    mean: sum / sorted.length(),
    median: sorted[middle],
    range: high - low,
    distinct,
  }
}

///|
pub fn interval_statistics(notes : Array[Note]) -> IntervalStatistics {
  let histogram = melodic_interval_histogram(notes)
  let count = if notes.length() < 2 { 0 } else { notes.length() - 1 }
  if count == 0 {
    return {
      count: 0,
      minimum: 0,
      maximum: 0,
      mean: 0,
      steps: 0,
      leaps: 0,
      repeated: 0,
    }
  }
  let mut total = 0
  let mut minimum = 100000
  let mut maximum = 0
  for i in 0..<histogram.length() {
    let frequency = histogram[i]
    if frequency > 0 {
      total += i * frequency
      if i < minimum {
        minimum = i
      }
      if i > maximum {
        maximum = i
      }
    }
  }
  {
    count,
    minimum,
    maximum,
    mean: total / count,
    steps: if histogram.length() > 2 {
      histogram[1] + histogram[2]
    } else {
      0
    },
    leaps: if histogram.length() > 3 {
      count - histogram[0] - histogram[1] - histogram[2]
    } else {
      0
    },
    repeated: histogram[0],
  }
}

///|
pub fn pair_statistics(
  cantus : Array[Note],
  counter : Array[Note],
) -> PairStatistics {
  let n = if cantus.length() < counter.length() {
    cantus.length()
  } else {
    counter.length()
  }
  let mut aligned = 0
  let mut contrary = 0
  let mut parallel = 0
  let mut similar = 0
  let mut oblique = 0
  let mut static_motion = 0
  let mut vertical_total = 0
  for i in 0..<n {
    if cantus[i].onset == counter[i].onset {
      aligned += 1
    }
    vertical_total += absolute_melodic_interval(cantus[i], counter[i])
  }
  if n > 1 {
    for i in 1..<n {
      match motion(cantus[i - 1], cantus[i], counter[i - 1], counter[i]) {
        Contrary => contrary += 1
        Parallel => parallel += 1
        Similar => similar += 1
        Oblique => oblique += 1
        Static => static_motion += 1
      }
    }
  }
  {
    aligned,
    contrary,
    parallel,
    similar,
    oblique,
    static_motion,
    average_vertical: if n == 0 {
      0
    } else {
      vertical_total / n
    },
  }
}

///|
pub fn register_bands(notes : Array[Note], width : Int) -> Array[RegisterBand] {
  let result : Array[RegisterBand] = []
  if width <= 0 {
    return result
  }
  let statistics = pitch_statistics(notes)
  let mut start = statistics.minimum
  while start <= statistics.maximum {
    let high = start + width - 1
    let mut count = 0
    for note in notes {
      if start <= note.midi && note.midi <= high {
        count += 1
      }
    }
    result.push({
      low: start,
      high,
      count,
      percentage: if notes.length() == 0 {
        0
      } else {
        count * 100 / notes.length()
      },
    })
    start += width
  }
  result
}

///|
pub fn weighted_pitch_center(notes : Array[Note]) -> Int {
  if notes.length() == 0 {
    return 0
  }
  let mut weighted = 0
  let mut weight = 0
  for note in notes {
    let duration = if note.duration <= 0 { 1 } else { note.duration }
    weighted += note.midi * duration
    weight += duration
  }
  weighted / weight
}

///|
pub fn pitch_variance_proxy(notes : Array[Note]) -> Int {
  if notes.length() == 0 {
    return 0
  }
  let center = average_pitch(notes)
  let mut total = 0
  for note in notes {
    let difference = note.midi - center
    total += difference * difference
  }
  total / notes.length()
}

///|
pub fn density_by_measure(meter : Meter, notes : Array[Note]) -> Array[Int] {
  let measures = summarize_rhythm(meter, notes).measures
  let result = Array::make(if measures <= 0 { 1 } else { measures }, 0)
  for note in notes {
    let measure = measure_of(meter, note.onset)
    if measure >= 0 && measure < result.length() {
      result[measure] += 1
    }
  }
  result
}

///|
pub fn maximum_density(meter : Meter, notes : Array[Note]) -> Int {
  let mut result = 0
  for value in density_by_measure(meter, notes) {
    if value > result {
      result = value
    }
  }
  result
}

///|
pub fn compare_pitch_statistics(left : Array[Note], right : Array[Note]) -> Int {
  pitch_statistics(left).mean - pitch_statistics(right).mean
}

///|
pub fn compare_contours(left : Array[Note], right : Array[Note]) -> Int {
  contour_balance(left) - contour_balance(right)
}

///|
pub fn cadence_distance(notes : Array[Note], target : Int) -> Int {
  if notes.length() == 0 {
    return 0
  }
  let last = notes[notes.length() - 1].midi
  if last > target {
    last - target
  } else {
    target - last
  }
}
