import 'dart:convert';

import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';

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

  static String translateFrom(TutorSpecialty typeMentorCategory, BuildContext context) {
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

class TranslateUtils {
  final Locale locale;

  TranslateUtils(this.locale);

  static TranslateUtils of(BuildContext context) {
    return Localizations.of<TranslateUtils>(
      context,
      TranslateUtils,
    )!;
  }

  static const LocalizationsDelegate<TranslateUtils> delegate =
  _TranslateUtilsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('bundle/app_${locale.languageCode}.arb');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  String translateEnum<T extends Enum>(T? value) {
    if (value == null) return '${value.runtimeType.toString()}_$value';
    return _localizedStrings['${value.runtimeType.toString()}_${value.name}'] ??
        '${value.runtimeType.toString()}_${value.name}';
  }
}

class _TranslateUtilsDelegate extends LocalizationsDelegate<TranslateUtils> {
  const _TranslateUtilsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "vi"].contains(locale.languageCode);
  }

  @override
  Future<TranslateUtils> load(Locale locale) async {
    TranslateUtils localizations = TranslateUtils(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_TranslateUtilsDelegate old) => false;
}
