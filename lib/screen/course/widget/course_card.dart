import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/widgets/custom_text.dart';

import '../../../utils/widget_utils.dart';

class CourseCard extends StatelessWidget {

  final Function()? onTap;


  const CourseCard({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: WidgetUtils.commonRadius,
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: WidgetUtils.commonRadius,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e",
                  // fit: BoxFit.cover,
                  height: 120.h,
                  placeholder: (context, url) => Center(
                    child: Image.asset("assets/home_page/ic_no_image.png"),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/home_page/ic_no_image.png"),
                ),
              ),
              Positioned(
                  bottom: -5,
                  right: 0,
                  child: Chip(
                    label: CustomText(
                      text: "Intermediate",
                    ),
                  ))
            ]),
            WidgetUtils.vSpace10(),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    text:
                        "Course tiltle Course tiltleCourse tiltleCourse tiltleCourse tiltleCourse tiltle",
                    fontWeight: FontWeight.bold,
                    maxLine: 2,
                  ),
                  WidgetUtils.vSpace10(),
                  CustomText(
                    text: "This is description of course This is description of course  This is description of course",
                    maxLine: 3,
                    color: AppColors.hintTextColor,
                  ),
                  WidgetUtils.vSpace(20),
                  CustomText(
                    text: "9 lessons",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
