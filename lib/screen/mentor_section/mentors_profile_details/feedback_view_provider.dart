import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/tutor/Feedback.dart';
import 'package:lettutor_flutter/data/model/tutor/Tutor.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorInforDetailResponse.dart';
import 'package:lettutor_flutter/data/model/tutor/feedback/FeedbackResponse.dart';
import 'package:lettutor_flutter/data/repository/tutor_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

class FeedbackViewProvider extends ChangeNotifier {
  int LIMIT_PER_PAGE = 10;

  TutorRepository _tutorRepository = getIt.get<TutorRepository>();
  String? userId;
  Tutor? tutor;
  TutorInforDetailResponse? tutorInforDetail;
  List<FeedbackData> feedbacks = List.empty();
  int currentPage = 1;
  BuildContext context;

  FeedbackViewProvider(String this.userId, this.context) {
    getFeedbackOfTutor();
  }

  void getFeedbackOfTutor() {
    SimpleWorker<FeedbackResponse>(
        task: () => _tutorRepository.getFeedbackOfTutor(
            userId!, LIMIT_PER_PAGE, currentPage),
        onCompleted: (res) {
          if (res != null) {
            feedbacks = res.data?.feedbacks ?? List.empty();
            notifyListeners();
          }
        }).start();
  }
}
