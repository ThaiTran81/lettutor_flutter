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
      MentorCategory(of.tutorCategory_all, TypeMentorCategory.ALL),
      MentorCategory(of.tutorCategory_eng4kids, TypeMentorCategory.E_4_KIDS),
      MentorCategory(of.tutorCategory_eng4business, TypeMentorCategory.E_4_BUSINESS),
      MentorCategory(of.tutorCategory_conversational, TypeMentorCategory.CONVERSATIONAL),
      MentorCategory(of.tutorCategory_starter, TypeMentorCategory.STARTERS),
      MentorCategory(of.tutorCategory_mover, TypeMentorCategory.MOVERS),
      MentorCategory(of.tutorCategory_flyer, TypeMentorCategory.FLYERS),
      MentorCategory(of.tutorCategory_ket, TypeMentorCategory.PET),
      MentorCategory(of.tutorCategory_ielts, TypeMentorCategory.IELTS),
      MentorCategory(of.tutorCategory_toefl, TypeMentorCategory.TOELF),
      MentorCategory(of.tutorCategory_toeic, TypeMentorCategory.TOEIC)
    ];
  }
}