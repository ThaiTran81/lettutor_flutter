import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/auth/widgets/base_form_field.dart';

import '../../../utils/app_consts.dart';

class FormTextField extends BaseFormField<String> {
  final Function()? onTap;
  TextEditingController controller;
  IconButton? suffixIcon;
  Icon? prefixIcon;

  FormTextField(
      {Key? key,
      this.suffixIcon,
      required this.controller,
      this.prefixIcon,
      this.onTap,
      String? Function(String?)? validator,
      String? title,
      String? hintText,
      bool? enabled,
      String? initialValue,
      bool mandatory = false})
      : super(
            title: title,
            hintText: hintText,
            mandatory: mandatory,
            active: enabled,
            buildField: (field) => TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        enabled ?? true ? AppColors.white : AppColors.fillGrey,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 1.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                    hintText: '$hintText',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.fillGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  enabled: enabled ?? true,
                )) {
    if (initialValue != null) {
      controller.text = initialValue;
    }
  }
}
