import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CacheImage extends StatelessWidget {
  String url;
  double? height;
  double? width;

  CacheImage({Key? key, required this.url, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => Center(
        child: Image.asset("assets/home_page/ic_no_image.png"),
      ),
      errorWidget: (context, url, error) =>
          Image.asset("assets/home_page/ic_no_image.png"),
    );
  }
}
