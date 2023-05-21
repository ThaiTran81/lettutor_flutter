import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TutorSchedule.dart';
import 'package:lettutor_thaitran81/data/model/schedule/BookingScheduleReponse.dart';
import 'package:lettutor_thaitran81/data/repository/schedule_repository.dart';
import 'package:lettutor_thaitran81/data/repository/tutor_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/provider/auth_provider.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

class MentorBookingScreenProvider extends ChangeNotifier {
  TutorRepository _tutorRepository = getIt.get<TutorRepository>();
  ScheduleRepository _scheduleRepository = getIt.get<ScheduleRepository>();
  AuthProvider _authProvider = getIt.get<AuthProvider>();
  List<TutorSchedule> tutorSchedules = [];
  DateTime selectedDate = DateTime.now();

  MentorBookingScreenProvider(String tutorId) {
    loadScheduleBy(tutorId, DateTime.now());
  }

  void setScheduleList(List<TutorSchedule> data) {
    tutorSchedules = data;
    notifyListeners();
  }

  void loadScheduleBy(String tutorId, DateTime dateTime) {
    dateTime =
        dateTime.copyWith(hour: 0, minute: 0, millisecond: 0, microsecond: 0);
    SimpleWorker<List<TutorSchedule>?>(
        task: () =>
            _scheduleRepository.getScheduleByTutorIdAndDate(tutorId, dateTime),
        onCompleted: (res) {
          if (res != null) {
            var list =
                res.where((schedule) => schedule.isBooked != true).toList();

            list.sort((a, b) {
              var date1 =
                  DateTime.fromMillisecondsSinceEpoch(a.startTimestamp!);
              var date2 =
                  DateTime.fromMillisecondsSinceEpoch(b.startTimestamp!);

              return date1.compareTo(date2);
            });
            setScheduleList(list);
          }
        }).start();
  }

  bool compareDate(DateTime dateTime1, DateTime dateTime2) {
    // Create new DateTime instances with the hour component set to 0
    DateTime date1 =
        DateTime(dateTime1.year, dateTime1.month, dateTime1.day, 0);
    DateTime date2 =
        DateTime(dateTime2.year, dateTime2.month, dateTime2.day, 0);

    // Compare the dates without considering the hour component
    return date1.isAtSameMomentAs(date2);
  }

  void bookSchedule(TutorSchedule tutorSchedule, String? note) {
    SimpleWorker<BookingScheduleReponse?>(
      task: () => _scheduleRepository.bookSchedule(
          tutorSchedule.scheduleDetails!.first.id!, note),
      onCompleted: (data) {
        if (data != null) {
          EasyLoading.showSuccess(data.message ?? '');
          _authProvider.updateBalance(getBalance() - 1);
          tutorSchedules.remove(tutorSchedule);
          notifyListeners();
        }
      },
      onErrorResponse: (error) {
        if (error?.response?.statusCode == 400) {
          EasyLoading.showError(error?.response?.data["message"] ?? "");
          notifyListeners();
        }
      },
    ).start();
  }

  int getBalance() {
    var userData = _authProvider.getUserData();
    var walletInfo = userData?.walletInfo;
    return walletInfo?.amount ?? 0;
  }
}
