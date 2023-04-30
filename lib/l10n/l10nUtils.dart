import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_flutter/data/model/mentor/TypeMentorCategory.dart';

class I10nUtils {
  // String getTranslate(BuildContext context, dynamic type) {
  //   String classname = type.runtimeType.toString();
  //   if (classname == (String).runtimeType.toString()) {
  //     AppLocalizations.of(context).
  //   }
  //   return "";
  // }

  static final List<CountryDetails?> _countryList = CountryCodes.countryCodes();

  static String getCountryName(String code) {
    for (int i = 0; i < _countryList.length; i++) {
      if (_countryList[i]?.alpha2Code == code.toUpperCase()) {
        return _countryList[i]?.name ?? '';
      }
    }
    return "";
  }

  static String translateFrom(
      TutorSpecialty typeMentorCategory, BuildContext context) {
    switch (typeMentorCategory) {
      case TutorSpecialty.ALL:
        return AppLocalizations.of(context).tutorCategory_all;
      case TutorSpecialty.E_4_KIDS:
        return AppLocalizations.of(context).tutorCategory_eng4kids;
      case TutorSpecialty.E_4_BUSINESS:
        return AppLocalizations.of(context).tutorCategory_eng4business;
      case TutorSpecialty.CONVERSATIONAL:
        return AppLocalizations.of(context).tutorCategory_conversational;
      case TutorSpecialty.STARTERS:
        return AppLocalizations.of(context).tutorCategory_starter;
      case TutorSpecialty.MOVERS:
        return AppLocalizations.of(context).tutorCategory_mover;
      case TutorSpecialty.FLYERS:
        return AppLocalizations.of(context).tutorCategory_flyer;
      case TutorSpecialty.KET:
        return AppLocalizations.of(context).tutorCategory_ket;
      case TutorSpecialty.PET:
        return AppLocalizations.of(context).tutorCategory_pet;
      case TutorSpecialty.IELTS:
        return AppLocalizations.of(context).tutorCategory_ielts;
      case TutorSpecialty.TOELF:
        return AppLocalizations.of(context).tutorCategory_toefl;
      case TutorSpecialty.TOEIC:
        return AppLocalizations.of(context).tutorCategory_toeic;
      default:
        return '';
    }
  }

  static String translateExperienceLevel(int level) {
    switch (level) {
      case 0:
        return "Any level";
      case 1:
        return "Beginner";
      case 2:
        return "Upper-beginner";
      case 3:
      case 4:
        return "Intermediate";
      default:
        return "Advanced";
    }
  }
}