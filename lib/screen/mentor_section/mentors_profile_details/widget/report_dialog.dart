import 'package:flutter/material.dart';

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
        decoration: InputDecoration(hintText: 'Enter your report here'),
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String report = _textEditingController.text.trim();
            onSubmit(report);
            Navigator.pop(context);
          },
          child: Text('Report'),
        ),
      ],
    );
  }
}
