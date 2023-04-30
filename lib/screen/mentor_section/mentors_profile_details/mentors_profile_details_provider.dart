import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/tutor/Tutor.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorInforDetailResponse.dart';
import 'package:lettutor_flutter/data/repository/tutor_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

class MentorsProfileDetailsProvider extends ChangeNotifier {
  TutorRepository _tutorRepository = getIt.get<TutorRepository>();
  String? tutorId;
  Tutor? tutor;
  TutorInforDetailResponse? tutorInforDetail;

  MentorsProfileDetailsProvider(Tutor tutor) {
    this.tutorId = tutor.userId;
    this.tutor = tutor;
    getTutorInformationDetail();
  }

  void getTutorInformationDetail() {
    SimpleWorker<TutorInforDetailResponse?>(
      task: () => _tutorRepository.getTutorInformationBy(tutorId!),
      onCompleted: (res) {
        if (res != null) {
          setTutor(res);
        }
      },
    ).start();
  }

  void setTutor(TutorInforDetailResponse tutorInforDetailResponse) {
    this.tutorInforDetail = tutorInforDetailResponse;

    notifyListeners();
  }
}
