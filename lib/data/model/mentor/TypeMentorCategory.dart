enum TutorSpecialty {
  NULL,
  ALL,
  E_4_KIDS,
  E_4_BUSINESS,
  CONVERSATIONAL,
  STARTERS,
  MOVERS,
  FLYERS,
  KET,
  PET,
  IELTS,
  TOELF,
  TOEIC;

  static Map<String, TutorSpecialty> tutorSpecialtyOfCodeMap = {
    'business-english': TutorSpecialty.E_4_BUSINESS,
    'conversational-english': TutorSpecialty.CONVERSATIONAL,
    'english-for-kids': TutorSpecialty.E_4_KIDS,
    'ielts': TutorSpecialty.IELTS,
    'starters': TutorSpecialty.STARTERS,
    'movers': TutorSpecialty.MOVERS,
    'flyers': TutorSpecialty.FLYERS,
    'ket': TutorSpecialty.KET,
    'pet': TutorSpecialty.PET,
    'toefl': TutorSpecialty.TOELF,
    'toeic': TutorSpecialty.TOEIC
  };

  static TutorSpecialty from(String? specialtyCode) {
    if (specialtyCode == null) {
      return TutorSpecialty.NULL;
    }
    return tutorSpecialtyOfCodeMap[specialtyCode] ?? TutorSpecialty.NULL;
  }

  String toCode() {
    return tutorSpecialtyOfCodeMap.keys
        .where((key) => tutorSpecialtyOfCodeMap[key] == this)
        .first;
  }
}
