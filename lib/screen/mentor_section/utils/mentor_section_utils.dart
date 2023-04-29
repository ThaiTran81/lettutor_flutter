import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_flutter/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_flutter/screen/mentor_section/view_model/mentor_category.dart';

class MentorSectionUtils {
  List<Tab> getCategoriesTab(BuildContext context) {
    List<Tab> tabs = initCategories(context)
        .map((e) => Tab(
                child: Container(
              decoration: const BoxDecoration(),
              child: Text(e.name),
            )))
        .toList();
    return tabs;
  }

  static List<MentorCategory> initCategories(BuildContext context) {
    var of = AppLocalizations.of(context);
    return [
      MentorCategory(of.tutorCategory_all, TutorSpecialty.ALL),
      MentorCategory(of.tutorCategory_eng4kids, TutorSpecialty.E_4_KIDS),
      MentorCategory(
          of.tutorCategory_eng4business, TutorSpecialty.E_4_BUSINESS),
      MentorCategory(
          of.tutorCategory_conversational, TutorSpecialty.CONVERSATIONAL),
      MentorCategory(of.tutorCategory_starter, TutorSpecialty.STARTERS),
      MentorCategory(of.tutorCategory_mover, TutorSpecialty.MOVERS),
      MentorCategory(of.tutorCategory_flyer, TutorSpecialty.FLYERS),
      MentorCategory(of.tutorCategory_ket, TutorSpecialty.PET),
      MentorCategory(of.tutorCategory_ielts, TutorSpecialty.IELTS),
      MentorCategory(of.tutorCategory_toefl, TutorSpecialty.TOELF),
      MentorCategory(of.tutorCategory_toeic, TutorSpecialty.TOEIC)
    ];
  }
}