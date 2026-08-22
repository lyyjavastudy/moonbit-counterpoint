///|
test "production pipeline exposes explainable output" {
  let cantus = cantus_simple()
  let counter = [
    Note::new(midi=67, onset=0, duration=2),
    Note::new(midi=65, onset=2, duration=2),
    Note::new(midi=72, onset=4, duration=2),
    Note::new(midi=81, onset=6, duration=2),
    Note::new(midi=79, onset=8, duration=2),
  ]
  let input = PipelineInput::new(
    cantus~,
    counterpoint=counter,
    meter=Meter::new(numerator=4, denominator=4),
    profile=RuleProfileConfig::classroom(),
  )
  let output = run_pipeline(input)
  inspect(pipeline_is_explainable(output), content="true")
  inspect(output.rhythm.notes, content="5")
  inspect(pipeline_report_section_count(output) >= 5, content="true")
}

///|
test "catalog and exercise APIs are populated" {
  inspect(rule_card_count() > 0, content="true")
  inspect(exercise_count() >= 100, content="true")
  inspect(has_feature("candidate-generation"), content="true")
  inspect(supported_rule_count(), content="9")
}

///|
test "interchange preserves note sequences" {
  let notes = cantus_simple()
  let rows = rows_from_notes(notes)
  let restored = notes_from_rows(rows)
  inspect(same_sequence(notes, restored), content="true")
  inspect(sequence_fingerprint(notes) != "", content="true")
  inspect(notes_to_lines(notes).length(), content="6")
}

///|
test "transformations preserve transposition intervals" {
  let notes = cantus_simple()
  inspect(transformation_round_trip(notes, 7), content="true")
  inspect(contour_preserved_after_transpose(notes, 5), content="true")
  inspect(transformation_count() > 0, content="true")
}

///|
test "batch and history APIs compare variants" {
  let cantus = cantus_simple()
  let variants = [cantus, transpose(cantus, 2)]
  let report = batch_report(
    cantus,
    variants,
    ["original", "transposed"],
    RuleProfileConfig::classroom(),
  )
  inspect(batch_count(report), content="2")
  inspect(batch_best_label(report) is Some(_), content="true")
  let validation = validate_pair(
    cantus,
    variants[0],
    RuleProfileConfig::classroom(),
  )
  let history = add_snapshot(empty_history(), snapshot("first", validation))
  inspect(history.snapshots.length(), content="1")
}
