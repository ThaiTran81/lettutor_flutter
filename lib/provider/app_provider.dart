import 'package:flutter/cupertino.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';

class AppProvider extends ChangeNotifier {
  String selectedLanguage = "en";

  void changeLanguage(String languageCode) {
    if (!languagesSupport.containsKey(languageCode)) {
      return;
    }
    selectedLanguage = languageCode;
    notifyListeners();
  }
}
