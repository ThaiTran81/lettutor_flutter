enum StudyLevel {
  beginer,
  higher_beginer,
  pre_intermediate,
  intermediate,
  upper_intermediate,
  advanced,
  proficiency;

  static final Map<String, StudyLevel> codeStudyLevelMap = {
    "BEGINER": StudyLevel.beginer,
    "HIGHER_BEGINNER": StudyLevel.higher_beginer,
    "PRE_INTERMEDIATE": StudyLevel.pre_intermediate,
    "INTERMEDIATE": StudyLevel.intermediate,
    "UPPER_INTERMEDIATE": StudyLevel.upper_intermediate,
    "ADVANCED": StudyLevel.advanced,
    "PROFICIENCY": StudyLevel.proficiency
  };
}
