import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/widgets/custom_text.dart';

import '../utils/app_consts.dart';

class CustomButton extends StatelessWidget {
  StyleButton? styleButton = StyleButton();
  Widget? child;
  final Function()? onPressed;

  CustomButton({this.child, this.styleButton, super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: styleButton?.outlineColor ?? AppColors.primary),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(styleButton?.radius ?? 10)),
            backgroundColor: styleButton?.fillColor ?? AppColors.lightBleu),
        child: SizedBox(
          width: styleButton?.width,
          height: styleButton?.height,
          child: child,
        ));
  }
}

class CustomTextButton extends StatelessWidget {
  CustomText? text;
  StyleButton? styleButton;
  final Function()? onPressed;
  String? data;
  Alignment? alignment;

  CustomTextButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.styleButton,
      this.alignment});

  CustomTextButton.withText({super.key, required String text, this.onPressed}) {
    this.text = CustomText(
      text: text,
      fontSize: 16.sp,
      color: AppColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      styleButton: styleButton,
      child: Align(alignment: alignment ?? Alignment.center, child: text),
    );
  }
}

class StyleButton {
  Color? outlineColor;
  Color? fillColor;
  double? width;
  double? height;
  double? radius;

  StyleButton(
      {this.outlineColor,
      this.fillColor,
      this.width,
      this.height,
      this.radius});
}
