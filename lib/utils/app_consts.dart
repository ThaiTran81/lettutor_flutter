import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConst {
  static String bearerToken = "Bearer";

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme textTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    bodySmall: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    titleMedium: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyLarge: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    titleSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyMedium: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    titleLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    labelLarge: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}

class AppColors {
  static const Color white = Colors.white;
  static const Color primary = Color.fromRGBO(0, 123, 255, 1);
  static const Color title = Color(0xFF1A1D1F);
  static const Color webtitle = Color(0xFF313131);
  static const Color body = Color(0xFF6F767E);
  static const Color indicatorColor = Color.fromRGBO(0, 123, 255, 1);
  static const Color webButtonColor = Color(0xff468DFF);

  static const Color subTiltle = Color(0xFF33383F);
  static const Color non_select = Color(0xFF6F767E);

  static const Color divider = Color(0xFF6F767E);

  static const Color secondary = Color(0xFFFF8000);
  static const Color hintTextColor = Color(0xFF6F767E);

  static const Color textColor = Color(0xff1976D2);

  static const Color success = Color(0xff29D697);
  static const Color danger = Color(0xffFF6A54);
  static const Color information = Color(0xff1877F2);
  static const Color warning = Color(0xffFF991A);

  static const Color primaryBg = Color(0xff1877F2);
  static const Color bg2 = Color(0xffF8FAFC);

  static const Color border = Color(0xffEAEAEA);
  static const Color lightBleu = Color(0xffE2F5FF);
  static const Color backgrounColor = Colors.white;
  static const Color productBackGroundColor = Color(0xffF6F6F6);
  static const Color fillGrey = Color(0xffE2EAF4);

  static const Color scaffoldBackgroundColor = const Color(0xFF343541);
  static const Color cardColor = const Color(0xFF444654);
}

Map<String, FlagsCode> languagesSupport = {
  "vi": FlagsCode.VN,
  "en": FlagsCode.GB
};
