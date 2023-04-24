import 'package:flutter/material.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';

// ignore: must_be_immutable
class LightRadialBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(3, (index) => AppColors.lightBleu);

  LightRadialBackground({required this.color, required this.position});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [...list, this.color],
        center: (position == "bottomRight")
            ? Alignment(1.0, 1.0)
            : Alignment(-1.0, -1.0),
      ),
    )));
  }
}
