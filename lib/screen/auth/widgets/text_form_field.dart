// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_consts.dart';

class FromField extends StatelessWidget {
  final Function()? onTap;
  TextEditingController? controller;
  String? title;
  String? hintText;
  IconButton? suffixIcon;
  Icon? prefixIcon;
  FromField(
      {Key? key,
      this.hintText,
      this.title,
      this.suffixIcon,
      this.controller,
      this.prefixIcon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 2.w),
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
                    border: const OutlineInputBorder()),
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
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
                    border: const OutlineInputBorder()),
              )
            ],
          );
  }
}
