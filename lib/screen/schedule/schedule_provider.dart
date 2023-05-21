import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleData.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_thaitran81/data/model/schedule/cancel_reason.dart';
import 'package:lettutor_thaitran81/data/repository/schedule_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

class ScheduleProvider extends ChangeNotifier {
  final ScheduleRepository _scheduleRepository =
      getIt.get<ScheduleRepository>();
  static const int LIMIT_PER_PAGE = 100;
  int totalCount = 0;
  int currentPage = 1;
  List<ScheduleData> bookedClasses = List.empty();

  ScheduleProvider() {
    getBookedSchedule();
  }

  void getBookedSchedule() {
    SimpleWorker<ScheduleResponse?>(
      task: () =>
          _scheduleRepository.getBookedClass(LIMIT_PER_PAGE, currentPage),
      onCompleted: (res) {
        if (res != null) {
          totalCount = res.data?.count ?? 0;
          bookedClasses = res.data?.rows ?? List.empty();
          notifyListeners();
        }
      },
    ).start();
  }

  void cancelSchedule(String id, CancelReason selectedReason, String note, BuildContext context) {
    SimpleWorker<dynamic>(
      task: () => _scheduleRepository.cancelSchedule(id, selectedReason, note),
      onCompleted: (data) {
        bookedClasses.remove(bookedClasses.where((bookingInfo) => bookingInfo.id == id).first);
        notifyListeners();
      },
      messageOnSuccess: TranslateUtils.of(context).translate("cancel_shedule_success"),
      onErrorResponse: (err) {
        var statusCode = err?.response?.statusCode;
        if (statusCode == 400) {
          var msg = err?.response?.data['message'] ?? '';
          EasyLoading.showError(msg);
          if (msg == 'Booking does not exist') {
            bookedClasses.remove(bookedClasses.where((bookingInfo) => bookingInfo.id == id).first);
            notifyListeners();
          }
        }
      },
    ).start();
  }
}