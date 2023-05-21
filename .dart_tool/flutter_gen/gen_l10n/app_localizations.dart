import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @tutorCategory_all.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get tutorCategory_all;

  /// No description provided for @tutorCategory_eng4kids.
  ///
  /// In en, this message translates to:
  /// **'English for kids'**
  String get tutorCategory_eng4kids;

  /// No description provided for @tutorCategory_eng4business.
  ///
  /// In en, this message translates to:
  /// **'English for business'**
  String get tutorCategory_eng4business;

  /// No description provided for @tutorCategory_conversational.
  ///
  /// In en, this message translates to:
  /// **'Conversational'**
  String get tutorCategory_conversational;

  /// No description provided for @tutorCategory_starter.
  ///
  /// In en, this message translates to:
  /// **'STARTER'**
  String get tutorCategory_starter;

  /// No description provided for @tutorCategory_mover.
  ///
  /// In en, this message translates to:
  /// **'MOVER'**
  String get tutorCategory_mover;

  /// No description provided for @tutorCategory_ket.
  ///
  /// In en, this message translates to:
  /// **'KET'**
  String get tutorCategory_ket;

  /// No description provided for @tutorCategory_pet.
  ///
  /// In en, this message translates to:
  /// **'PET'**
  String get tutorCategory_pet;

  /// No description provided for @tutorCategory_flyer.
  ///
  /// In en, this message translates to:
  /// **'FLYER'**
  String get tutorCategory_flyer;

  /// No description provided for @tutorCategory_ielts.
  ///
  /// In en, this message translates to:
  /// **'IELTS'**
  String get tutorCategory_ielts;

  /// No description provided for @tutorCategory_toefl.
  ///
  /// In en, this message translates to:
  /// **'TOEFL'**
  String get tutorCategory_toefl;

  /// No description provided for @tutorCategory_toeic.
  ///
  /// In en, this message translates to:
  /// **'TOEIC'**
  String get tutorCategory_toeic;

  /// No description provided for @btn_book_tutor.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get btn_book_tutor;

  /// No description provided for @studyLevel_beginer.
  ///
  /// In en, this message translates to:
  /// **'Pre A1 (Beginner)'**
  String get studyLevel_beginer;

  /// No description provided for @studyLevel_higher_beginer.
  ///
  /// In en, this message translates to:
  /// **'A1 (Higher Beginner)'**
  String get studyLevel_higher_beginer;

  /// No description provided for @studyLevel_pre_intermediate.
  ///
  /// In en, this message translates to:
  /// **'A2 (Pre-lntermediate)'**
  String get studyLevel_pre_intermediate;

  /// No description provided for @studyLevel_intermediate.
  ///
  /// In en, this message translates to:
  /// **'B1 (Intermediate)'**
  String get studyLevel_intermediate;

  /// No description provided for @studyLevel_upper_intermediate.
  ///
  /// In en, this message translates to:
  /// **'B2 (Upper-Intermediate)'**
  String get studyLevel_upper_intermediate;

  /// No description provided for @studyLevel_advanced.
  ///
  /// In en, this message translates to:
  /// **'C1 (Advanced)'**
  String get studyLevel_advanced;

  /// No description provided for @studyLevel_proficiency.
  ///
  /// In en, this message translates to:
  /// **'C2 (Proficiency)'**
  String get studyLevel_proficiency;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
