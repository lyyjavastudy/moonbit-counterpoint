///|
pub(all) enum RuleProfile {
  Classroom
  Strict
  Renaissance
  Custom
} derive(Debug, Eq, ToJson)

///|
pub(all) enum VoiceRole {
  Cantus
  Counterpoint
  Upper
  Lower
} derive(Debug, Eq, ToJson)

///|
pub(all) struct RuleProfileConfig {
  profile : RuleProfile
  allow_hidden_perfect : Bool
  allow_weak_beat_dissonance : Bool
  require_cadence : Bool
  max_span : Int
  max_leap : Int
  max_consecutive_perfect : Int
} derive(Debug, Eq, ToJson)

///|
pub fn RuleProfileConfig::classroom() -> RuleProfileConfig {
  {
    profile: Classroom,
    allow_hidden_perfect: true,
    allow_weak_beat_dissonance: true,
    require_cadence: true,
    max_span: 16,
    max_leap: 12,
    max_consecutive_perfect: 2,
  }
}

///|
pub fn RuleProfileConfig::strict() -> RuleProfileConfig {
  {
    profile: Strict,
    allow_hidden_perfect: false,
    allow_weak_beat_dissonance: false,
    require_cadence: true,
    max_span: 12,
    max_leap: 9,
    max_consecutive_perfect: 1,
  }
}

///|
pub fn RuleProfileConfig::renaissance() -> RuleProfileConfig {
  {
    profile: Renaissance,
    allow_hidden_perfect: true,
    allow_weak_beat_dissonance: true,
    require_cadence: true,
    max_span: 19,
    max_leap: 12,
    max_consecutive_perfect: 3,
  }
}

///|
pub fn RuleProfileConfig::custom(
  allow_hidden_perfect~ : Bool,
  allow_weak_beat_dissonance~ : Bool,
  require_cadence~ : Bool,
  max_span~ : Int,
  max_leap~ : Int,
  max_consecutive_perfect~ : Int,
) -> RuleProfileConfig {
  {
    profile: Custom,
    allow_hidden_perfect,
    allow_weak_beat_dissonance,
    require_cadence,
    max_span,
    max_leap,
    max_consecutive_perfect,
  }
}

///|
pub fn RuleProfileConfig::label(self : RuleProfileConfig) -> String {
  match self.profile {
    Classroom => "classroom"
    Strict => "strict"
    Renaissance => "renaissance"
    Custom => "custom"
  }
}

///|
pub fn RuleProfileConfig::is_valid(self : RuleProfileConfig) -> Bool {
  self.max_span > 0 &&
  self.max_leap > 0 &&
  self.max_consecutive_perfect > 0 &&
  self.max_leap <= self.max_span + 12
}

///|
pub fn RuleProfileConfig::with_profile(
  self : RuleProfileConfig,
  profile : RuleProfile,
) -> RuleProfileConfig {
  match profile {
    Classroom => RuleProfileConfig::classroom()
    Strict => RuleProfileConfig::strict()
    Renaissance => RuleProfileConfig::renaissance()
    Custom => { ..self, profile: Custom }
  }
}

///|
pub fn profile_config(profile : RuleProfile) -> RuleProfileConfig {
  match profile {
    Classroom => RuleProfileConfig::classroom()
    Strict => RuleProfileConfig::strict()
    Renaissance => RuleProfileConfig::renaissance()
    Custom => RuleProfileConfig::classroom().with_profile(Custom)
  }
}

///|
pub fn severity_rank(severity : Severity) -> Int {
  match severity {
    Info => 0
    Warning => 1
    Error => 2
  }
}

///|
pub fn rule_is_structural(rule : RuleKind) -> Bool {
  match rule {
    SpeciesRhythm => true
    MelodyRange => true
    LargeLeap => true
    LeapRecovery => true
    _ => false
  }
}

///|
pub fn rule_is_harmonic(rule : RuleKind) -> Bool {
  match rule {
    ParallelPerfect => true
    HiddenPerfect => true
    VoiceCrossing => true
    DissonancePlacement => true
    CadenceShape => true
    _ => false
  }
}
