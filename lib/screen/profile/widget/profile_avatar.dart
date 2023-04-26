import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? image;
  final Color? color;
  final IconData? icon;

  ProfileAvatar(
      {Key? key,
      required this.color,
      this.icon,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: CachedNetworkImage(
          height: 60,
          width: 60,
          fit: BoxFit.cover,
          imageUrl: image!,
          placeholder: (context, url) => Center(
            child: Image.asset("assets/home_page/ic_no_image.png"),
          ),
          errorWidget: (context, url, error) =>
              Image.asset("assets/home_page/ic_no_image.png"),
        ));
  }
}
