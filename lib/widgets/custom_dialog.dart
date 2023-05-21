import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';

class CustomDialog extends StatelessWidget {
  late String title;
  late Widget? content;

  CustomDialog({super.key, required this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        alignment: Alignment.center,
        child: Text(title),
      ),
      content: content,
    );
  }
}

class InformDialog extends StatelessWidget {
  String title = 'Notification';
  late String bodyMessage;
  Function() onTap;

  InformDialog({super.key, required this.bodyMessage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget content = LimitedBox(
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      maxWidth: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Text(bodyMessage),
          ),
          Column(
            children: [
              Divider(color: AppColors.divider, thickness: 3.0),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Close'),
                ),
                onTap: onTap,
              ),
            ],
          )
        ],
      ),
    );
    return CustomDialog(title: title, content: content);
  }
}
