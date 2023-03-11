import 'package:flutter/material.dart';

class AppConst {

  /// This is Dummy URL
  static const String _baseUrlTest = "https://olearn.onesttech.com";

  /// Make sure you are in live server or test server by base url
  static String baseUrlApi = "$_baseUrlTest/api/dev";
  static String bearerToken = "Bearer";

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


}
