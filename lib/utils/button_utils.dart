import 'package:flutter/cupertino.dart';

import '../widgets/custom_button.dart';

class ButtonUtils {
  static CustomButton iconButton(
      Icon icon, StyleButton styleButton, Function()? onPressed) {
    return CustomButton(
        styleButton: styleButton, onPressed: onPressed, child: icon);
  }

  static CustomButton circleButton(Icon icon, StyleButton styleButton, Function()? onPressed) {
    styleButton.radius = 360;
    return iconButton(icon, styleButton, onPressed);
  }
}