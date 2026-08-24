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
test "catalogs expose curated guidance for each rule" {
  inspect(rule_card_count(), content="9")
  inspect(exercise_count(), content="27")
  inspect(exercises_for_rule(ParallelPerfect).length(), content="3")
  inspect(exercise("first-parallel-fifths") is Some(_), content="true")
  inspect(exercise("missing-exercise") is None, content="true")
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
test "phrase partitioning creates bounded analysis windows" {
  let notes = cantus_simple()
  let partition = partition_phrases(
    notes,
    Meter::new(numerator=2, denominator=4),
    2,
  )
  inspect(phrase_window_count(partition), content="3")
  inspect(partition.total_notes, content="5")
  inspect(phrase_window(partition, -1) is None, content="true")
  inspect(phrase_window(partition, 1) is Some(_), content="true")
  inspect(
    phrase_window_summary(partition.windows[0]).contains("notes=2"),
    content="true",
  )
}

///|
test "candidate evaluation exposes constraint evidence" {
  let cantus = cantus_simple()
  let policy = CandidatePolicy::strict()
  let evaluation = evaluate_candidate(
    cantus[0],
    cantus[1],
    Note::new(midi=67, onset=0, duration=2),
    Note::new(midi=65, onset=2, duration=2),
    Note::new(midi=69, onset=2, duration=2),
    policy,
  )
  inspect(candidate_evaluation_count(evaluation), content="4")
  inspect(
    candidate_evaluation_has(evaluation, CandidateConstraint::Range),
    content="true",
  )
  inspect(
    candidate_evaluation_summary(evaluation).contains("accepted="),
    content="true",
  )
}

///|
test "analysis triage groups findings into repair priorities" {
  let counter = [
    Note::new(midi=67, onset=0, duration=2),
    Note::new(midi=69, onset=2, duration=2),
    Note::new(midi=71, onset=4, duration=2),
    Note::new(midi=72, onset=6, duration=2),
    Note::new(midi=74, onset=8, duration=2),
  ]
  let triage = triage_analysis(analyze_counterpoint(cantus_simple(), counter))
  inspect(triage_item_count(triage) > 0, content="true")
  inspect(triage_rule_count(triage, ParallelPerfect) > 0, content="true")
  inspect(triage_band_name(triage.band), content="critical")
  inspect(triage_markdown(triage).contains("Repair priority"), content="true")
  inspect(
    triage_item_summary(triage.items[0]).contains("rule="),
    content="true",
  )
  inspect(triage_csv(triage).contains("priority"), content="true")
}

///|
test "voice report explains register violations" {
  let assessment = assess_voice(
    [
      Note::new(midi=72, onset=0, duration=2),
      Note::new(midi=90, onset=2, duration=2),
    ],
    Counterpoint,
    Soprano,
  )
  inspect(voice_assessment_status(assessment), content="review")
  inspect(voice_assessment_violation_rate(assessment), content="50")
  inspect(
    voice_assessment_summary(assessment).contains("violations=1"),
    content="true",
  )
  inspect(voice_assessment_repair_distance(assessment), content="6")
  inspect(voice_assessment_is_extreme(assessment), content="false")
}

///|
test "repair suggestions are bounded and apply to one event" {
  let notes = [
    Note::new(midi=60, onset=0, duration=2),
    Note::new(midi=84, onset=2, duration=2),
    Note::new(midi=83, onset=4, duration=2),
  ]
  let finding = Finding::error(rule=LargeLeap, index=1, message="large leap")
  let suggestions = repair_suggestions(finding, notes, 12, 48, 84)
  inspect(repair_suggestion_count(suggestions) > 0, content="true")
  inspect(repair_suggestion_all_in_range(suggestions, 48, 84), content="true")
  let repaired = apply_repair_suggestion(notes, suggestions[0])
  inspect(repaired.length(), content="3")
  inspect(repaired[0] == notes[0], content="true")
  inspect(
    repair_suggestion_summary(suggestions[0]).contains("index=1"),
    content="true",
  )
  inspect(repair_suggestion_average_score(suggestions) > 0, content="true")
  inspect(repair_suggestion_kinds(suggestions).length() > 0, content="true")
}

///|
test "new analysis APIs handle empty and invalid boundaries" {
  let empty_partition = partition_phrases(
    [],
    Meter::new(numerator=0, denominator=0),
    0,
  )
  inspect(phrase_window_count(empty_partition), content="0")
  inspect(phrase_partition_boundaries(empty_partition).length(), content="0")
  let invalid_finding = Finding::error(
    rule=MelodyRange,
    index=-1,
    message="invalid index",
  )
  inspect(
    repair_suggestion_count(repair_suggestions(invalid_finding, [], 12, 48, 84)),
    content="0",
  )
  let empty_voice = assess_voice([], Upper, Alto)
  inspect(voice_assessment_status(empty_voice), content="pass")
  inspect(voice_assessment_violation_rate(empty_voice), content="0")
  inspect(voice_assessment_pitch_center(empty_voice), content="0")
}

///|
test "candidate evidence records failed strict constraints" {
  let cantus = cantus_simple()
  let evaluation = evaluate_candidate(
    cantus[0],
    cantus[1],
    Note::new(midi=67, onset=0, duration=2),
    Note::new(midi=65, onset=2, duration=2),
    Note::new(midi=100, onset=2, duration=2),
    CandidatePolicy::strict(),
  )
  inspect(
    candidate_evaluation_passes(evaluation, CandidateConstraint::Range),
    content="false",
  )
  inspect(candidate_evaluation_failed(evaluation).length() > 0, content="true")
  inspect(best_evaluation([evaluation]) is Some(_), content="true")
}

///|
test "curated exercise queries remain deterministic" {
  inspect(exercises_for_level("foundation").length() > 0, content="true")
  inspect(
    next_exercise(ParallelPerfect, ["first-parallel-fifths"]) is Some(_),
    content="true",
  )
  inspect(
    exercise_catalog_markdown(CadenceShape).contains("cadence-planner"),
    content="true",
  )
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
