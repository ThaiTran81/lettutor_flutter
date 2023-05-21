import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';

class ReportDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String title;
  final Function(String message) onSubmit;

  ReportDialog({required this.title, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
            hintText: TranslateUtils.of(context)
                .translate("tutor_detail_screen.report.report_field.hint")),
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(TranslateUtils.of(context)
              .translate("tutor_detail_screen.report.btn_cancel")),
        ),
        ElevatedButton(
          onPressed: () {
            String report = _textEditingController.text.trim();
            onSubmit(report);
            Navigator.pop(context);
          },
          child: Text(TranslateUtils.of(context)
              .translate("tutor_detail_screen.report.title")),
        ),
      ],
    );
  }
}
