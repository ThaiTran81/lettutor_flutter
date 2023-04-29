import 'package:flutter/material.dart';

import '../../../utils/app_consts.dart';

class Tag extends StatelessWidget {
  String? text;
  EdgeInsets? margin;

  Tag({this.text, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        label:
            Text(text ?? '', style: const TextStyle(color: AppColors.primary)),
        backgroundColor: AppColors.lightBleu,
      ),
    );
  }
}
