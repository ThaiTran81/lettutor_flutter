import 'package:flutter/cupertino.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleData.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_thaitran81/data/repository/schedule_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

class HistoryScreenProvider extends ChangeNotifier {
  static const int LIMIT_PER_PAGE = 100;
  ScheduleRepository _scheduleRepository = getIt.get<ScheduleRepository>();
  List<ScheduleData> bookedClassHistory = List.empty();
  int currentPage = 1;
  int totalCount = 0;

  HistoryScreenProvider() {
    getHistoryBookedClass();
  }

  void getHistoryBookedClass() {
    SimpleWorker<ScheduleResponse>(
        task: () => _scheduleRepository.getBookedClassHistory(
            LIMIT_PER_PAGE, currentPage),
        onCompleted: (res) {
          if (res != null) {
            totalCount = res.data?.count ?? 0;
            bookedClassHistory = res.data?.rows ?? List.empty();
            notifyListeners();
          }
        }).start();
  }
}
