///|
pub(all) enum LessonStage {
  Listen
  Identify
  Repair
  Compose
  Reflect
} derive(Debug, Eq, ToJson)

///|
pub(all) struct LessonStep {
  index : Int
  stage : LessonStage
  title : String
  prompt : String
  expected_rule : RuleKind?
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PracticePlan {
  title : String
  objective : String
  steps : Array[LessonStep]
  estimated_minutes : Int
  difficulty : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PracticeResult {
  completed : Int
  total : Int
  score : Int
  next_stage : LessonStage
  feedback : String
} derive(Debug, Eq, ToJson)

///|
pub fn lesson_stage_name(stage : LessonStage) -> String {
  match stage {
    Listen => "listen"
    Identify => "identify"
    Repair => "repair"
    Compose => "compose"
    Reflect => "reflect"
  }
}

///|
pub fn lesson_stage_index(stage : LessonStage) -> Int {
  match stage {
    Listen => 0
    Identify => 1
    Repair => 2
    Compose => 3
    Reflect => 4
  }
}

///|
pub fn next_lesson_stage(stage : LessonStage) -> LessonStage {
  match stage {
    Listen => Identify
    Identify => Repair
    Repair => Compose
    Compose => Reflect
    Reflect => Reflect
  }
}

///|
pub fn lesson_step(
  index : Int,
  stage : LessonStage,
  title : String,
  prompt : String,
  rule : RuleKind?,
) -> LessonStep {
  { index, stage, title, prompt, expected_rule: rule }
}

///|
pub fn default_practice_plan(rule : RuleKind) -> PracticePlan {
  let title = "Practice \{rule_family(rule)}"
  let steps = [
    lesson_step(
      0,
      Listen,
      "Hear the phrase",
      "Play or inspect the phrase before editing it.",
      None,
    ),
    lesson_step(
      1,
      Identify,
      "Locate the event",
      "Find the smallest event that demonstrates the rule.",
      Some(rule),
    ),
    lesson_step(
      2,
      Repair,
      "Try one repair",
      "Change one note and compare the new findings.",
      Some(rule),
    ),
    lesson_step(
      3,
      Compose,
      "Write a variation",
      "Create a second phrase using the same constraint.",
      Some(rule),
    ),
    lesson_step(
      4,
      Reflect,
      "Explain the choice",
      "Record why the final choice is more stable.",
      None,
    ),
  ]
  {
    title,
    objective: rule_explanation(rule),
    steps,
    estimated_minutes: 15 + lesson_stage_index(Reflect) * 2,
    difficulty: if rule_is_structural(rule) {
      "foundation"
    } else {
      "intermediate"
    },
  }
}

///|
pub fn plan_for_analysis(analysis : Analysis) -> PracticePlan {
  match highest_severity(analysis) {
    None => default_practice_plan(CadenceShape)
    Some(Error) =>
      if analysis_has_rule(analysis, ParallelPerfect) {
        default_practice_plan(ParallelPerfect)
      } else if analysis_has_rule(analysis, LargeLeap) {
        default_practice_plan(LargeLeap)
      } else {
        default_practice_plan(VoiceCrossing)
      }
    Some(Warning) => default_practice_plan(CadenceShape)
    Some(Info) => default_practice_plan(SpeciesRhythm)
  }
}

///|
pub fn evaluate_practice(
  plan : PracticePlan,
  completed : Int,
  score : Int,
) -> PracticeResult {
  let safe_completed = if completed < 0 {
    0
  } else if completed > plan.steps.length() {
    plan.steps.length()
  } else {
    completed
  }
  let next = if safe_completed == 0 {
    Listen
  } else {
    plan.steps[safe_completed - 1].stage
  }
  {
    completed: safe_completed,
    total: plan.steps.length(),
    score: if score < 0 {
      0
    } else if score > 100 {
      100
    } else {
      score
    },
    next_stage: next_lesson_stage(next),
    feedback: if safe_completed == plan.steps.length() {
      "Practice complete; write a short reflection."
    } else {
      "Continue with the next guided step."
    },
  }
}

///|
pub fn plan_progress(result : PracticeResult) -> Int {
  if result.total == 0 {
    0
  } else {
    result.completed * 100 / result.total
  }
}

///|
pub fn plan_is_complete(result : PracticeResult) -> Bool {
  result.completed == result.total
}

///|
pub fn plan_step(plan : PracticePlan, index : Int) -> LessonStep? {
  if index < 0 || index >= plan.steps.length() {
    None
  } else {
    Some(plan.steps[index])
  }
}

///|
pub fn plan_markdown(plan : PracticePlan) -> String {
  let lines : Array[String] = [
    "## \{plan.title}",
    "",
    "- Objective: \{plan.objective}",
    "- Difficulty: \{plan.difficulty}",
    "- Estimated time: \{plan.estimated_minutes} minutes",
    "",
  ]
  for step in plan.steps {
    lines.push(
      "\{step.index + 1}. [\{lesson_stage_name(step.stage)}] \{step.title} — \{step.prompt}",
    )
  }
  lines.join("\n")
}

///|
pub fn lesson_stage_order() -> Array[LessonStage] {
  [Listen, Identify, Repair, Compose, Reflect]
}

///|
pub fn lesson_prompts(stage : LessonStage) -> Array[String] {
  match stage {
    Listen =>
      [
        "What do you hear?", "Where does the phrase feel stable?", "Which event attracts attention?",
      ]
    Identify =>
      [
        "Which rule is involved?", "What is the interval?", "Is the beat accented?",
      ]
    Repair =>
      [
        "Can contrary motion help?", "Can the leap be reduced?", "Can the cadence be clarified?",
      ]
    Compose =>
      [
        "Write a two-note alternative.", "Extend the idea.", "Keep the profile consistent.",
      ]
    Reflect =>
      [
        "What changed?", "Which finding disappeared?", "What would you try next?",
      ]
  }
}

///|
pub fn rule_learning_level(rule : RuleKind) -> String {
  if rule_is_structural(rule) {
    "foundation"
  } else if rule_is_harmonic(rule) {
    "intermediate"
  } else {
    "advanced"
  }
}

///|
pub fn learning_objective(rule : RuleKind) -> String {
  "Learner can identify and repair \{rule_family(rule)} findings with an evidence-based edit."
}
