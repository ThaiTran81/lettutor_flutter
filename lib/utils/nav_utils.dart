import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/widgets/base_screen.dart';

class NavUtil {
  static navigateScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return BaseScreen(child: screen);
        },
        transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
//      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static replaceScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen), ModalRoute.withName("/Home"));
  }
}