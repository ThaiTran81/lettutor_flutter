import 'package:flutter/material.dart';
import 'package:lettutor_flutter/widgets/custom_dialog.dart';

class DialogUtils {
  static void showInform(
      {required BuildContext context, String? title, required String msgBody}) {
    showDialog(
        context: context,
        builder: (context) => InformDialog(
            bodyMessage: msgBody,
            onTap: () {
              Navigator.pop(context);
            }));
  }
}
