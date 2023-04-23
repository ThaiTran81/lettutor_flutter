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
  static String translateFrom(TypeMentorCategory typeMentorCategory, BuildContext context) {
    switch (typeMentorCategory) {
      case TypeMentorCategory.ALL:
        return AppLocalizations.of(context).tutorCategory_all;
      case TypeMentorCategory.E_4_KIDS:
        return AppLocalizations.of(context).tutorCategory_eng4kids;
      case TypeMentorCategory.E_4_BUSINESS:
        return AppLocalizations.of(context).tutorCategory_eng4business;
      case TypeMentorCategory.CONVERSATIONAL:
        return AppLocalizations.of(context).tutorCategory_conversational;
      case TypeMentorCategory.STARTERS:
        return AppLocalizations.of(context).tutorCategory_starter;
      case TypeMentorCategory.MOVERS:
        return AppLocalizations.of(context).tutorCategory_mover;
      case TypeMentorCategory.FLYERS:
        return AppLocalizations.of(context).tutorCategory_flyer;
      case TypeMentorCategory.KET:
        return AppLocalizations.of(context).tutorCategory_ket;
      case TypeMentorCategory.PET:
        return AppLocalizations.of(context).tutorCategory_pet;
      case TypeMentorCategory.IELTS:
        return AppLocalizations.of(context).tutorCategory_ielts;
      case TypeMentorCategory.TOELF:
        return AppLocalizations.of(context).tutorCategory_toefl;
      case TypeMentorCategory.TOEIC:
        return AppLocalizations.of(context).tutorCategory_toeic;
    }
  }
}