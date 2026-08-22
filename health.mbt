///|
pub fn library_version() -> String {
  "0.3.0"
}

///|
pub fn library_name() -> String {
  "moonbit-counterpoint"
}

///|
pub fn supported_species() -> Array[Species] {
  [First, Second, Third, Fourth, Fifth]
}

///|
pub fn supported_rule_count() -> Int {
  9
}

///|
pub fn supported_profile_count() -> Int {
  valid_profiles().length()
}

///|
pub fn production_features() -> Array[String] {
  [
    "counterpoint-analysis", "timeline-validation", "rhythm-analysis", "contour-analysis",
    "candidate-generation", "explainable-reports", "practice-plans", "quality-gates",
    "interchange",
  ]
}

///|
pub fn health_summary() -> String {
  "\{library_name()} \{library_version()} supports \{supported_rule_count()} rules and \{supported_profile_count()} profiles"
}

///|
pub fn has_feature(name : String) -> Bool {
  for feature in production_features() {
    if feature == name {
      return true
    }
  }
  false
}

///|
pub fn feature_count() -> Int {
  production_features().length()
}

///|
pub fn package_ready() -> Bool {
  library_version() != "" && supported_rule_count() > 0 && feature_count() > 0
}

///|
pub fn ready_message() -> String {
  if package_ready() {
    "package ready"
  } else {
    "package incomplete"
  }
}

///|
pub fn species_count() -> Int {
  supported_species().length()
}
