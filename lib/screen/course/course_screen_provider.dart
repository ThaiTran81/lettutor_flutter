import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/model/course/course/CourseInfo.dart';
import 'package:lettutor_thaitran81/data/model/course/course/CourseResponse.dart';
import 'package:lettutor_thaitran81/data/model/course/ebook/EbookInfo.dart';
import 'package:lettutor_thaitran81/data/model/course/ebook/EbookResponse.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/data/model/user/StudyLevel.dart';
import 'package:lettutor_thaitran81/data/repository/course_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/screen/course/course_filter_screen.dart';
import 'package:lettutor_thaitran81/utils/Pair.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

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
  TextEditingController searchTextFieldController = TextEditingController();
  String search = "";
  List<TutorSpecialty> tutorSpecialties = [];
  List<StudyLevel> studyLevels = [];
  SortByLevel sortByLevel = SortByLevel.asc;

  // course
  Pair<int, TabData<CourseInfo>> totalAndCourseTabData = Pair(0, TabData());

  // ebook
  Pair<int, TabData<EbookInfo>> totalAndEbookTabData = Pair(0, TabData());

  List<CourseInfo> courseResultList = [];
  List<CourseInfo> _ebookList = [];

  CourseTab currentTab = CourseTab.course;

  Timer? timeHandle;

  CourseScreenProvider() {
    selectTab(currentTabIndex);
  }

  void selectTab(int index) {
    currentTabIndex = index;
    currentTab =
        CourseTab.values.where((tab) => tab.index == currentTabIndex).first;
    switch (currentTab) {
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
        processResultList();
        notifyListeners();
      }, false);
    }

    processResultList();
  }

  void handleEbookTabContent() {
    var tabData = totalAndEbookTabData.second;
    if (tabData!.dataList.isEmpty) {
      tabData.currentPage = 1;
      loadData<EbookResponse>(
          () => _courseRepository.getEbookListByPagination(
              LIMIT_PER_PAGE, tabData.currentPage), (res) {
        var data = res.data;
        tabData.dataList = data?.ebookList ?? List.empty();
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

  void getSearchValue() {
    search = searchTextFieldController.text ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }
    timeHandle = Timer(const Duration(seconds: 1), () {
      getCourseListByCriteria();
    });
  }

  void getCourseListByCriteria() {

  }

  void searchCourse(List<TutorSpecialty> tutorSpecialties,
      SortByLevel sortByLevel, List<StudyLevel> studyLevels) {
    this.tutorSpecialties = tutorSpecialties;
    this.studyLevels = studyLevels;
    this.sortByLevel = sortByLevel;
    processResultList();
  }

  void processResultList() {
    var courseList = totalAndCourseTabData.second?.dataList ?? [];
    courseResultList = courseList.where((course) {
      var checkCategory;
      if (tutorSpecialties.length == 0 || (tutorSpecialties.length == 1 && tutorSpecialties.contains(TutorSpecialty.ALL))) {
        checkCategory = true;
      } else {
        checkCategory = course.categories
            ?.where((cate) =>
            tutorSpecialties.contains(TutorSpecialty.from(cate.key)))
            .toList().length == tutorSpecialties.length;
      }
      var checkLevel;
      if (studyLevels.length == 0) {
        checkLevel = true;
      } else {
        checkLevel = course.level != null ? studyLevels.contains(StudyLevel.values[course.level!]) : true;
      }

      return checkCategory && checkLevel;
    }).toList();
    notifyListeners();
  }
}
