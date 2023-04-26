
import 'package:flutter/cupertino.dart';

class SpaceUtils {
  static SizedBox hSpace5 = hSpace(5);
  static BorderRadius commonRadius = BorderRadius.circular(10);

  static SizedBox vSpace10() {
    return const SizedBox(height: 10);
  }

  static SizedBox vSpace(double height) {
    return SizedBox(
      height: height
    );
  }

  static SizedBox hSpace10() {
    return SizedBox(
      width: 10,
    );
  }

  static SizedBox hSpace(double width) {
    return SizedBox(
      width: width,
    );
  }
}