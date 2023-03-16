import 'package:flutter/material.dart';

class MentorsProfileDetailsProvider extends ChangeNotifier {
  var userResponseId;

  MentorsProfileDetailsProvider(var tutorId) {
    userResponseId = tutorId;
  }
}
