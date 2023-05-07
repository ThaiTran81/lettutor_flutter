enum TutorSpecialty {
  NULL(null),
  ALL(null),
  E_4_KIDS(5),
  E_4_BUSINESS(3),
  CONVERSATIONAL(4),
  STARTERS(1),
  MOVERS(2),
  FLYERS(3),
  KET(4),
  PET(5),
  IELTS(6),
  TOELF(7),
  TOEIC(8);

  final int? digitCode;

  const TutorSpecialty(this.digitCode);

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
