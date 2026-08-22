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
pub fn rule_cards() -> Array[RuleCard] {
  [
    {
      code: "parallelperfect-1",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 1",
      rationale: "This check makes harmony motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "parallelperfect-2",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 2",
      rationale: "This check makes harmony motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "parallelperfect-3",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 3",
      rationale: "This check makes harmony motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "parallelperfect-4",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 4",
      rationale: "This check makes harmony motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "parallelperfect-5",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 5",
      rationale: "This check makes harmony motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "parallelperfect-6",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 6",
      rationale: "This check makes harmony motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "parallelperfect-7",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 7",
      rationale: "This check makes harmony motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "parallelperfect-8",
      rule: ParallelPerfect,
      topic: "harmony",
      level: "foundation",
      title: "ParallelPerfect check 8",
      rationale: "This check makes harmony motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-1",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 1",
      rationale: "This check makes harmony motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-2",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 2",
      rationale: "This check makes harmony motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-3",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 3",
      rationale: "This check makes harmony motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-4",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 4",
      rationale: "This check makes harmony motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-5",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 5",
      rationale: "This check makes harmony motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-6",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 6",
      rationale: "This check makes harmony motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-7",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 7",
      rationale: "This check makes harmony motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "hiddenperfect-8",
      rule: HiddenPerfect,
      topic: "harmony",
      level: "foundation",
      title: "HiddenPerfect check 8",
      rationale: "This check makes harmony motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-1",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 1",
      rationale: "This check makes harmony motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-2",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 2",
      rationale: "This check makes harmony motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-3",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 3",
      rationale: "This check makes harmony motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-4",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 4",
      rationale: "This check makes harmony motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-5",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 5",
      rationale: "This check makes harmony motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-6",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 6",
      rationale: "This check makes harmony motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-7",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 7",
      rationale: "This check makes harmony motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "voicecrossing-8",
      rule: VoiceCrossing,
      topic: "harmony",
      level: "foundation",
      title: "VoiceCrossing check 8",
      rationale: "This check makes harmony motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-1",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 1",
      rationale: "This check makes harmony motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-2",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 2",
      rationale: "This check makes harmony motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-3",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 3",
      rationale: "This check makes harmony motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-4",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 4",
      rationale: "This check makes harmony motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-5",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 5",
      rationale: "This check makes harmony motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-6",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 6",
      rationale: "This check makes harmony motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-7",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 7",
      rationale: "This check makes harmony motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "dissonanceplacement-8",
      rule: DissonancePlacement,
      topic: "harmony",
      level: "intermediate",
      title: "DissonancePlacement check 8",
      rationale: "This check makes harmony motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "melodyrange-1",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 1",
      rationale: "This check makes melody motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "melodyrange-2",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 2",
      rationale: "This check makes melody motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "melodyrange-3",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 3",
      rationale: "This check makes melody motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "melodyrange-4",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 4",
      rationale: "This check makes melody motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "melodyrange-5",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 5",
      rationale: "This check makes melody motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "melodyrange-6",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 6",
      rationale: "This check makes melody motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "melodyrange-7",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 7",
      rationale: "This check makes melody motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "melodyrange-8",
      rule: MelodyRange,
      topic: "melody",
      level: "foundation",
      title: "MelodyRange check 8",
      rationale: "This check makes melody motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "largeleap-1",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 1",
      rationale: "This check makes melody motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "largeleap-2",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 2",
      rationale: "This check makes melody motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "largeleap-3",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 3",
      rationale: "This check makes melody motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "largeleap-4",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 4",
      rationale: "This check makes melody motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "largeleap-5",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 5",
      rationale: "This check makes melody motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "largeleap-6",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 6",
      rationale: "This check makes melody motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "largeleap-7",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 7",
      rationale: "This check makes melody motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "largeleap-8",
      rule: LargeLeap,
      topic: "melody",
      level: "intermediate",
      title: "LargeLeap check 8",
      rationale: "This check makes melody motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-1",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 1",
      rationale: "This check makes melody motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-2",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 2",
      rationale: "This check makes melody motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-3",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 3",
      rationale: "This check makes melody motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-4",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 4",
      rationale: "This check makes melody motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-5",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 5",
      rationale: "This check makes melody motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-6",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 6",
      rationale: "This check makes melody motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-7",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 7",
      rationale: "This check makes melody motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "leaprecovery-8",
      rule: LeapRecovery,
      topic: "melody",
      level: "advanced",
      title: "LeapRecovery check 8",
      rationale: "This check makes melody motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-1",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 1",
      rationale: "This check makes rhythm motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-2",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 2",
      rationale: "This check makes rhythm motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-3",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 3",
      rationale: "This check makes rhythm motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-4",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 4",
      rationale: "This check makes rhythm motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-5",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 5",
      rationale: "This check makes rhythm motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-6",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 6",
      rationale: "This check makes rhythm motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-7",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 7",
      rationale: "This check makes rhythm motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "speciesrhythm-8",
      rule: SpeciesRhythm,
      topic: "rhythm",
      level: "foundation",
      title: "SpeciesRhythm check 8",
      rationale: "This check makes rhythm motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-1",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 1",
      rationale: "This check makes cadence motion explicit at exercise position 1.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 1 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-2",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 2",
      rationale: "This check makes cadence motion explicit at exercise position 2.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 2 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-3",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 3",
      rationale: "This check makes cadence motion explicit at exercise position 3.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 3 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-4",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 4",
      rationale: "This check makes cadence motion explicit at exercise position 4.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 4 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-5",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 5",
      rationale: "This check makes cadence motion explicit at exercise position 5.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 5 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-6",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 6",
      rationale: "This check makes cadence motion explicit at exercise position 6.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 6 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-7",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 7",
      rationale: "This check makes cadence motion explicit at exercise position 7.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 7 before changing the whole phrase.",
    },
    {
      code: "cadenceshape-8",
      rule: CadenceShape,
      topic: "cadence",
      level: "intermediate",
      title: "CadenceShape check 8",
      rationale: "This check makes cadence motion explicit at exercise position 8.",
      remedy: "Review the surrounding notes, compare the interval labels, and try one contrary-motion alternative.",
      example: "Inspect position 8 before changing the whole phrase.",
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
    ParallelPerfect | HiddenPerfect | VoiceCrossing | DissonancePlacement =>
      "harmony"
    MelodyRange | LargeLeap | LeapRecovery => "melody"
    SpeciesRhythm => "rhythm"
    CadenceShape => "cadence"
  }
}

///|
pub fn rule_explanation(rule : RuleKind) -> String {
  let cards = cards_for_rule(rule)
  if cards.length() == 0 {
    "No explanation is registered."
  } else {
    cards[0].rationale
  }
}

///|
pub fn rule_remedy(rule : RuleKind) -> String {
  let cards = cards_for_rule(rule)
  if cards.length() == 0 {
    "Inspect the finding in context."
  } else {
    cards[0].remedy
  }
}

///|
pub fn recommendation_for_finding(finding : Finding) -> Recommendation {
  let cards = cards_for_rule(finding.rule)
  let offset = if cards.length() == 0 {
    0
  } else {
    finding.index % cards.length()
  }
  let card = if cards.length() == 0 {
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
  } else {
    cards[offset]
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
  ["harmony", "melody", "rhythm", "cadence"]
}

///|
pub fn catalog_levels() -> Array[String] {
  ["foundation", "intermediate", "advanced"]
}
