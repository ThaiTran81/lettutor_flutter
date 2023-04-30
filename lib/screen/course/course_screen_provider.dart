import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/course/course/CourseInfo.dart';
import 'package:lettutor_flutter/data/model/course/course/CourseResponse.dart';
import 'package:lettutor_flutter/data/model/course/ebook/EbookInfo.dart';
import 'package:lettutor_flutter/data/model/course/ebook/EbookResponse.dart';
import 'package:lettutor_flutter/data/repository/course_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/utils/Pair.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

enum CourseTab { course, ebook, interactiveBook }

class TabData<D> {
  int currentPage = 1;
  int resultCount = 0;
  List<D> dataList = List.empty(growable: true);
}

class CourseScreenProvider extends ChangeNotifier {
  static const int LIMIT_PER_PAGE = 100;
  CourseRepository _courseRepository = getIt.get<CourseRepository>();
  int currentTabIndex = 0;

  // course
  Pair<int, TabData<CourseInfo>> totalAndCourseTabData = Pair(0, TabData());

  // ebook
  Pair<int, TabData<EbookInfo>> totalAndEbookTabData = Pair(0, TabData());

  CourseScreenProvider() {
    selectTab(currentTabIndex);
  }

  void selectTab(int index) {
    currentTabIndex = index;
    CourseTab courseTab =
        CourseTab.values.where((tab) => tab.index == currentTabIndex).first;
    switch (courseTab) {
      case CourseTab.course:
        handleCourseTabContent();
        break;
      case CourseTab.ebook:
        handleEbookTabContent();
        break;
      case CourseTab.interactiveBook:
        handleInterativeBookTabContent();
        break;
    }
  }

  void handleCourseTabContent() {
    var tabData = totalAndCourseTabData.second;
    if (tabData!.dataList.isEmpty) {
      tabData.currentPage = 1;
      loadData<CourseResponse>(
          () => _courseRepository.getCourseListByPagination(
              LIMIT_PER_PAGE, tabData.currentPage), (res) {
        var data = res.data;
        tabData.dataList = data?.courses ?? List.empty();
        tabData.resultCount = data?.count ?? 0;
        notifyListeners();
      }, false);
    }
  }

  void handleEbookTabContent() {
    var tabData = totalAndEbookTabData.second;
    if (tabData!.dataList.isEmpty) {
      tabData.currentPage = 1;
      loadData<EbookResponse>(
          () => _courseRepository.getEbookListByPagination(
              LIMIT_PER_PAGE, tabData.currentPage), (res) {
        var data = res.data;
        tabData.dataList = data?.rows ?? List.empty();
        tabData.resultCount = data?.count ?? 0;
        notifyListeners();
      }, false);
    }
  }

  void handleInterativeBookTabContent() {}

  void loadData<T>(
      Function() task, Function(T res) onSuccess, bool isLoadMore) async {
    if (!isLoadMore) {
      SimpleWorker<T>(task: task, onCompleted: onSuccess).start();
    } else {
      var res = await task();
      onSuccess(res);
    }
  }
}
