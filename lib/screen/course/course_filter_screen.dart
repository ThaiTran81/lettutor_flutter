import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/data/model/user/StudyLevel.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lettutor_thaitran81/screen/course/course_screen_provider.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';
import 'package:lettutor_thaitran81/widgets/custom_button.dart';

class CourseFilterScreen extends StatefulWidget {
  CourseFilterScreen(
      {Key? key, this.onApplyFilter, required this.courseScreenProvider})
      : super(key: key);
  Function()? onApplyFilter;
  CourseScreenProvider courseScreenProvider;

  @override
  State<CourseFilterScreen> createState() => _CourseFilterScreenState();
}

class _CourseFilterScreenState extends State<CourseFilterScreen> {
  TutorSpecialty? currentSpecialty;
  late CourseScreenProvider _mentorsScreenProvider;
  List<TutorSpecialty> _tutorSpecialties = [];
  List<StudyLevel> _studyLevels = [];
  SortByLevel _sortByLevel = SortByLevel.asc;

  @override
  void didChangeDependencies() {
    _mentorsScreenProvider = widget.courseScreenProvider;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                    TranslateUtils.of(context)
                        .translate("tutor_screen.filter.title"),
                    style: AppConst.textTheme.headlineMedium),
              ),
              SpaceUtils.vSpace(20),
              Flexible(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                          TranslateUtils.of(context)
                              .translate("tutor_screen.filter.type.specialties"),
                          style: AppConst.textTheme.labelLarge),
                      SpaceUtils.vSpace10(),
                      Wrap(
                        children: buildSpecialtyFilterItem(context),
                      ),

                      SpaceUtils.vSpace(20),
                      Text(
                          TranslateUtils.of(context)
                              .translate("course_screen.filter.type.level"),
                          style: AppConst.textTheme.labelLarge),
                      SpaceUtils.vSpace10(),
                      Wrap(
                        children: buildLevelFilterItem(context),
                      ),
                      SpaceUtils.vSpace(20),
                      Text(
                          TranslateUtils.of(context)
                              .translate("course_screen.filter.type.level.sort"),
                          style: AppConst.textTheme.labelLarge),
                      SpaceUtils.vSpace10(),
                      Wrap(
                        children: buildLevelSortItem(context),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  ElevatedbuttonWidget(
                      onPressed: () {
                        _mentorsScreenProvider.searchCourse(_tutorSpecialties, _sortByLevel, _studyLevels);
                        Navigator.pop(context);
                      },
                      text: TranslateUtils.of(context).translate(
                          "tutor_screen.filter.type.specialties.btn_apply_filter")),
                  SpaceUtils.vSpace10(),
                  CustomTextButton.withText(
                      onPressed: () {
                        _mentorsScreenProvider.searchCourse(_tutorSpecialties, _sortByLevel, _studyLevels);
                        resetFilter();
                        Navigator.pop(context);
                      },
                      text: TranslateUtils.of(context).translate(
                          "tutor_screen.filter.type.specialties.btn_reset")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildSpecialtyFilterItem(BuildContext context) {
    return TutorSpecialty.values
        .where((specialtyItem) => specialtyItem != TutorSpecialty.NULL)
        .map((specialtyItem) {
          var isSelectd = _tutorSpecialties.contains(specialtyItem);
          return GestureDetector(
              onTap: () {
                setState(() {
                  isSelectd ? _tutorSpecialties.remove(specialtyItem) : _tutorSpecialties.add(specialtyItem);
                });
                // _mentorsScreenProvider
                //     .setSelectedSpecialtyFilter(specialtyItem);
              },
              child: Container(
                margin: EdgeInsets.all(2),
                child: Chip(
                  label: Text(
                      TranslateUtils.of(context)
                              ?.translateEnum<TutorSpecialty>(specialtyItem) ??
                          '',
                      style: AppConst.textTheme.titleSmall?.apply(
                          color: isSelectd
                              ? AppColors.primary
                              : AppColors.non_select)),
                  backgroundColor: isSelectd
                      ? AppColors.lightBleu
                      : AppColors.fillGrey,
                ),
              ),
            );
        })
        .toList();
  }

  List<Widget> buildLevelFilterItem(BuildContext context) {
    return StudyLevel.values
        .map((studyLevel) {
          var isSelected = _studyLevels.contains(studyLevel);
          return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected ? _studyLevels.remove(studyLevel) : _studyLevels.add(studyLevel);
                });
                // _mentorsScreenProvider
                //     .setSelectedSpecialtyFilter(specialtyItem);
              },
              child: Container(
                margin: EdgeInsets.all(2),
                child: Chip(
                  label: Text(
                      TranslateUtils.of(context)
                              .translateEnum<StudyLevel>(studyLevel) ??
                          '',
                      style: AppConst.textTheme.titleSmall?.apply(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.non_select)),
                  backgroundColor: isSelected
                      ? AppColors.lightBleu
                      : AppColors.fillGrey,
                ),
              ),
            );
        })
        .toList();
  }

  List<Widget> buildLevelSortItem(BuildContext context) {
    return SortByLevel.values
        .map((sortByLevel) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _sortByLevel == sortByLevel;
          });
          // _mentorsScreenProvider
          //     .setSelectedSpecialtyFilter(specialtyItem);
        },
        child: Container(
          margin: EdgeInsets.all(2),
          child: Chip(
            label: Text(
                TranslateUtils.of(context)
                    .translateEnum<SortByLevel>(sortByLevel) ??
                    '',
                style: AppConst.textTheme.titleSmall?.apply(
                    color: _sortByLevel == sortByLevel
                        ? AppColors.primary
                        : AppColors.non_select)),
            backgroundColor: _sortByLevel == sortByLevel
                ? AppColors.lightBleu
                : AppColors.fillGrey,
          ),
        ),
      );
    })
        .toList();
  }

  void resetFilter() {
    setState(() {
      _tutorSpecialties.clear();
      _studyLevels.clear();
      _sortByLevel = SortByLevel.asc;
    });
  }
}

enum SortByLevel {
  asc,
  desc
}