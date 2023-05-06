import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/auth/login_screen/login_provider.dart';
import 'package:lettutor_flutter/screen/auth/splash_screen.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  configLoading();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthProvider _authProvider = getIt.get<AuthProvider>();
  final MentorsScreenProvider _mentorsScreenProvider =
  getIt.get<MentorsScreenProvider>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LogInProvider()),
          ChangeNotifierProvider(create: (_) => _authProvider),
          ChangeNotifierProvider(create: (_) => _mentorsScreenProvider),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            LocaleNamesLocalizationsDelegate(),
            CountryLocalizations.delegate,
            TranslateUtils.delegate
          ],
          supportedLocales: [
            Locale("af"),
            Locale("am"),
            Locale("ar"),
            Locale("az"),
            Locale("be"),
            Locale("bg"),
            Locale("bn"),
            Locale("bs"),
            Locale("ca"),
            Locale("cs"),
            Locale("da"),
            Locale("de"),
            Locale("el"),
            Locale("en"),
            Locale("es"),
            Locale("et"),
            Locale("fa"),
            Locale("fi"),
            Locale("fr"),
            Locale("gl"),
            Locale("ha"),
            Locale("he"),
            Locale("hi"),
            Locale("hr"),
            Locale("hu"),
            Locale("hy"),
            Locale("id"),
            Locale("is"),
            Locale("it"),
            Locale("ja"),
            Locale("ka"),
            Locale("kk"),
            Locale("km"),
            Locale("ko"),
            Locale("ku"),
            Locale("ky"),
            Locale("lt"),
            Locale("lv"),
            Locale("mk"),
            Locale("ml"),
            Locale("mn"),
            Locale("ms"),
            Locale("nb"),
            Locale("nl"),
            Locale("nn"),
            Locale("no"),
            Locale("pl"),
            Locale("ps"),
            Locale("pt"),
            Locale("ro"),
            Locale("ru"),
            Locale("sd"),
            Locale("sk"),
            Locale("sl"),
            Locale("so"),
            Locale("sq"),
            Locale("sr"),
            Locale("sv"),
            Locale("ta"),
            Locale("tg"),
            Locale("th"),
            Locale("tk"),
            Locale("tr"),
            Locale("tt"),
            Locale("uk"),
            Locale("ug"),
            Locale("ur"),
            Locale("uz"),
            Locale("vi"),
            Locale("zh"),
            ...AppLocalizations.supportedLocales,
          ],
          theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.primary
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.primary
    ..textColor = AppColors.primary
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..userInteractions = false
    ..boxShadow = <BoxShadow>[];
}
