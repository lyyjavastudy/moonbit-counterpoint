///|
pub(all) enum RuleTopic {
  Harmony
  Melody
  Rhythm
  Cadence
  VoiceLeading
} derive(Debug, Eq, ToJson)

///|
pub(all) enum TeachingLevel {
  Foundation
  Intermediate
  Advanced
} derive(Debug, Eq, ToJson)

///|
pub(all) struct RuleCard {
  code : String
  rule : RuleKind
  topic : String
  level : String
  title : String
  rationale : String
  remedy : String
  example : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct Recommendation {
  code : String
  priority : Int
  title : String
  action : String
  evidence : String
} derive(Debug, Eq, ToJson)

///|
/// Each card documents one analyzer rule with an actionable domain-specific repair.
pub fn rule_cards() -> Array[RuleCard] {
  [
    {
      code: "parallel-perfect",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "Avoid consecutive perfect intervals",
      rationale: "Repeated fifths and octaves can make two lines sound fused instead of independent.",
      remedy: "Keep the stable sonority in one voice and move the other by contrary or oblique motion.",
      example: "Replace the second perfect interval with a third while preserving the melodic contour.",
    },
    {
      code: "hidden-perfect",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "intermediate",
      title: "Approach perfect intervals with care",
      rationale: "Similar motion into a perfect interval is strongest when the upper voice leaps.",
      remedy: "Approach the octave or fifth by contrary motion, or use a step in the upper voice.",
      example: "Keep the cadence pitch and rewrite the penultimate upper note as a stepwise approach.",
    },
    {
      code: "voice-crossing",
      rule: VoiceCrossing,
      topic: "voice-leading",
      level: "foundation",
      title: "Keep the voices in their registral order",
      rationale: "Crossing voices obscures the identity of the lines and weakens readable counterpoint.",
      remedy: "Move the crossing note by a step or transpose the local fragment into the intended register.",
      example: "Compare the crossing index with the nearest legal pitch in the same melodic direction.",
    },
    {
      code: "dissonance-placement",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "Resolve dissonance through a prepared motion",
      rationale: "A dissonance is most intelligible when its beat strength and neighboring motion explain it.",
      remedy: "Place the dissonance on a weak beat, prepare it by step, and resolve it by step.",
      example: "Turn an accented semitone clash into a passing tone between two consonances.",
    },
    {
      code: "melody-range",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "Keep the line within its intended span",
      rationale: "A compact range keeps a teaching phrase singable and makes its contour easier to hear.",
      remedy: "Move an outlying pitch by an octave-equivalent local step or revise the preceding leap.",
      example: "Preserve the highest point and bring the lowest event inside the configured span.",
    },
    {
      code: "large-leap",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "Limit unsupported melodic leaps",
      rationale: "Large leaps draw attention away from the phrase unless their register and direction are deliberate.",
      remedy: "Reduce the interval or place the leap at a structural point with a clear arrival.",
      example: "Replace a twelfth with a sixth and retain the same cadence target.",
    },
    {
      code: "leap-recovery",
      rule: LeapRecovery,
      topic: "melody",
      level: "intermediate",
      title: "Balance a leap with stepwise recovery",
      rationale: "A step in the opposite direction after a leap helps the line recover its tonal center.",
      remedy: "Make the next event move by step in the opposite direction, or reduce the original leap.",
      example: "After an upward sixth, choose a descending step before continuing the phrase.",
    },
    {
      code: "species-rhythm",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "Match events to the selected species",
      rationale: "Species-specific durations turn rhythmic constraints into predictable analysis and practice units.",
      remedy: "Use the expected subdivision for the species and mark suspensions with explicit ties.",
      example: "For second species, pair two counterpoint events with each cantus event.",
    },
    {
      code: "cadence-shape",
      rule: CadenceShape,
      topic: "cadence",
      level: "advanced",
      title: "Make the final approach structurally clear",
      rationale: "A cadence communicates closure through its final sonority and the direction of the approach.",
      remedy: "Reserve the final sonority for the last event and approach it with controlled contrary motion.",
      example: "Inspect the final two aligned events before changing any earlier material.",
    },
  ]
}

///|
pub fn rule_card_count() -> Int {
  rule_cards().length()
}

///|
pub fn cards_for_rule(rule : RuleKind) -> Array[RuleCard] {
  let result : Array[RuleCard] = []
  for card in rule_cards() {
    if card.rule == rule {
      result.push(card)
    }
  }
  result
}

///|
pub fn cards_for_topic(topic : String) -> Array[RuleCard] {
  let result : Array[RuleCard] = []
  for card in rule_cards() {
    if card.topic == topic {
      result.push(card)
    }
  }
  result
}

///|
pub fn cards_for_level(level : String) -> Array[RuleCard] {
  let result : Array[RuleCard] = []
  for card in rule_cards() {
    if card.level == level {
      result.push(card)
    }
  }
  result
}

///|
pub fn rule_card(rule : RuleKind, index : Int) -> RuleCard? {
  let cards = cards_for_rule(rule)
  if index < 0 || index >= cards.length() {
    None
  } else {
    Some(cards[index])
  }
}

///|
pub fn rule_topic_name(topic : RuleTopic) -> String {
  match topic {
    Harmony => "harmony"
    Melody => "melody"
    Rhythm => "rhythm"
    Cadence => "cadence"
    VoiceLeading => "voice-leading"
  }
}

///|
pub fn teaching_level_name(level : TeachingLevel) -> String {
  match level {
    Foundation => "foundation"
    Intermediate => "intermediate"
    Advanced => "advanced"
  }
}

///|
pub fn rule_family(rule : RuleKind) -> String {
  match rule {
    ParallelPerfect | HiddenPerfect | DissonancePlacement => "harmony"
    VoiceCrossing => "voice-leading"
    MelodyRange | LargeLeap | LeapRecovery => "melody"
    SpeciesRhythm => "rhythm"
    CadenceShape => "cadence"
  }
}

///|
pub fn rule_explanation(rule : RuleKind) -> String {
  match rule_card(rule, 0) {
    Some(card) => card.rationale
    None => "No explanation is registered."
  }
}

///|
pub fn rule_remedy(rule : RuleKind) -> String {
  match rule_card(rule, 0) {
    Some(card) => card.remedy
    None => "Inspect the finding in context."
  }
}

///|
pub fn recommendation_for_finding(finding : Finding) -> Recommendation {
  let card = match rule_card(finding.rule, 0) {
    Some(card) => card
    None =>
      {
        code: "general-review",
        rule: finding.rule,
        topic: rule_family(finding.rule),
        level: "foundation",
        title: "Review the local phrase",
        rationale: "Every finding should be evaluated in its musical context.",
        remedy: "Compare the current note with its neighbors.",
        example: "Make one controlled edit and run the analysis again.",
      }
  }
  {
    code: card.code,
    priority: severity_rank(finding.severity) * 10 + finding.index,
    title: card.title,
    action: card.remedy,
    evidence: finding.message,
  }
}

///|
pub fn recommendations(analysis : Analysis) -> Array[Recommendation] {
  let result : Array[Recommendation] = []
  for finding in analysis.findings {
    result.push(recommendation_for_finding(finding))
  }
  result
}

///|
pub fn top_recommendations(
  analysis : Analysis,
  limit : Int,
) -> Array[Recommendation] {
  let all = recommendations(analysis)
  let result : Array[Recommendation] = []
  let count = if limit < 0 {
    0
  } else if limit > all.length() {
    all.length()
  } else {
    limit
  }
  for i in 0..<count {
    result.push(all[i])
  }
  result
}

///|
pub fn recommendation_markdown(recommendation : Recommendation) -> String {
  "- [\{recommendation.priority}] \{recommendation.title}: \{recommendation.action} (\{recommendation.evidence})"
}

///|
pub fn recommendations_markdown(analysis : Analysis) -> String {
  let lines : Array[String] = ["## Next steps", ""]
  for recommendation in top_recommendations(analysis, 12) {
    lines.push(recommendation_markdown(recommendation))
  }
  lines.join("\n")
}

///|
pub fn recommendation_count_for_rule(
  analysis : Analysis,
  rule : RuleKind,
) -> Int {
  finding_count(analysis, rule)
}

///|
pub fn catalog_topics() -> Array[String] {
  ["harmony", "melody", "rhythm", "cadence", "voice-leading"]
}

///|
pub fn catalog_levels() -> Array[String] {
  ["foundation", "intermediate", "advanced"]
}
