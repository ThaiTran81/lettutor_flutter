import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';

abstract class BaseFormField<T> extends FormField<T> {
  final String? title;
  final String? hintText;
  final bool? active;
  final bool? mandatory;
  final Widget Function(FormFieldState<T> field) buildField;

  BaseFormField({
    Key? key,
    this.title,
    this.hintText,
    this.active,
    this.mandatory,
    required this.buildField,
    T? initialValue,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<T> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                buildField(field)
              ],
            );
          },
        );
}