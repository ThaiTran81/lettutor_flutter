import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';

abstract class BaseFormField<T> extends StatelessWidget {
  String? title;
  String? hintText;
  bool? enabled;
  bool? mandatory;
  T? initialValue;

  BaseFormField(
      {Key? key,
      this.title,
      this.hintText,
      this.enabled,
      this.mandatory,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text.rich(
        TextSpan(
            text: '$title',
            style: TextStyle(
                letterSpacing: 1,
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700),
            children: [
              TextSpan(
                  text: ' *',
                  style: TextStyle(
                      letterSpacing: 1,
                      color: AppColors.danger,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700))
            ]),
      ),
      SpaceUtils.vSpace10(),
      buildField(context)
    ]);
  }

  Widget buildField(BuildContext context);
}
