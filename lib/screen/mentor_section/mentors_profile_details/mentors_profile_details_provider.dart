import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lettutor_thaitran81/data/model/tutor/Tutor.dart';
import 'package:lettutor_thaitran81/data/model/tutor/TutorInforDetailResponse.dart';
import 'package:lettutor_thaitran81/data/repository/tutor_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';
import 'package:lettutor_thaitran81/utils/dialog_utils.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

class MentorsProfileDetailsProvider extends ChangeNotifier {
  TutorRepository _tutorRepository = getIt.get<TutorRepository>();
  MentorsScreenProvider _mentorsScreenProvider =
      getIt.get<MentorsScreenProvider>();
  String? tutorId;
  Tutor? tutor;
  TutorInforDetailResponse? tutorInforDetail;
  BuildContext context;

  MentorsProfileDetailsProvider(Tutor tutor, this.context) {
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

  void sendFavoriteTutor() {
    _tutorRepository.setFavoriteTutor(tutor?.userId ?? '').then((value) {
      tutor?.isfavoritetutor = value.result ?? false;
      notifyListeners();
      _mentorsScreenProvider.notifyListeners();
      var msg = value.result ?? false
          ? "added to favorite successfully"
          : "Removed from favorite";
      Fluttertoast.showToast(msg: msg);
    }, onError: (e) {
      DialogUtils.showInform(
          context: context,
          msgBody: "Oops!! Something go wrong! please try again!");
    });
  }

  void reportTutor(String message) {
    _tutorRepository.reportTutor(tutor?.userId ?? '', message).then((value) {
      notifyListeners();
      var msg = value.message ?? '';
      Fluttertoast.showToast(msg: msg);
    }, onError: (e) {
      DialogUtils.showInform(
          context: context,
          msgBody: "Oops!! Something go wrong! please try again!");
    });
  }
}
