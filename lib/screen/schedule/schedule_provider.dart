import 'package:flutter/cupertino.dart';
import 'package:lettutor_flutter/data/model/schedule/ScheduleData.dart';
import 'package:lettutor_flutter/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_flutter/data/repository/schedule_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

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
}