import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final double scale;
  final String? image;
  final Color? color;
  final IconData? icon;

  ProfileAvatar(
      {Key? key,
      required this.scale,
      required this.color,
      this.icon,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        height: 100.h,
        width: 100.h,
        fit: BoxFit.cover,
        imageUrl: image!,
        placeholder: (context, url) => Center(
          child: Image.asset("assets/home_page/ic_no_image.png"),
        ),
        errorWidget: (context, url, error) =>
            Image.asset("assets/home_page/ic_no_image.png"),
      ),
    );
  }
}
