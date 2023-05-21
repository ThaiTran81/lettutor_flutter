import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/widgets/custom_text.dart';

import '../../../utils/widget_utils.dart';

class CourseCard extends StatelessWidget {
  final Function()? onTap;
  String? title = '';
  String? imageUrl = '';
  String? description = '';
  String? bottomInfo = '';
  String? tag = '';

  CourseCard(
      {Key? key,
      this.onTap,
      this.title,
      this.imageUrl,
      this.description,
      this.bottomInfo,
      this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: SpaceUtils.commonRadius,
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: SpaceUtils.commonRadius,
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? "assets/home_page/ic_no_image.png",
                  // fit: BoxFit.cover,
                  height: 120.h,
                  placeholder: (context, url) => Center(
                    child: Image.asset("assets/home_page/ic_no_image.png"),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/home_page/ic_no_image.png"),
                ),
              ),
              if (tag != null && tag!.isNotEmpty)
                Positioned(
                    bottom: -5,
                    right: 0,
                    child: Chip(
                      label: CustomText(text: tag),
                    ))
            ]),
            SpaceUtils.vSpace10(),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    text: title,
                    fontWeight: FontWeight.bold,
                    maxLine: 2,
                  ),
                  SpaceUtils.vSpace10(),
                  CustomText(
                    text: description,
                    maxLine: 3,
                    color: AppColors.hintTextColor,
                  ),
                  SpaceUtils.vSpace(20),
                  CustomText(
                    text: bottomInfo,
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
