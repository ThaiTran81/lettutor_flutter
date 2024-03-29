import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';
import 'package:lettutor_thaitran81/widgets/custom_button.dart';

class TutorFilterScreen extends StatefulWidget {
  TutorFilterScreen(
      {Key? key, this.onApplyFilter, required this.mentorsScreenProvider})
      : super(key: key);
  Function()? onApplyFilter;
  MentorsScreenProvider mentorsScreenProvider;

  @override
  State<TutorFilterScreen> createState() => _TutorFilterScreenState();
}

class _TutorFilterScreenState extends State<TutorFilterScreen> {
  TutorSpecialty? currentSpecialty;
  late MentorsScreenProvider _mentorsScreenProvider;
  TutorSpecialty? _tutorSpecialty;

  @override
  void didChangeDependencies() {
    _mentorsScreenProvider = widget.mentorsScreenProvider;
    _tutorSpecialty = widget.mentorsScreenProvider.selectedSpecialtyFilter;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        TranslateUtils.of(context)
                            .translate("tutor_screen.filter.title"),
                        style: AppConst.textTheme.headlineMedium),
                  ),
                  SpaceUtils.vSpace(20),
                  Text(
                      TranslateUtils.of(context)
                          .translate("tutor_screen.filter.type.specialties"),
                      style: AppConst.textTheme.labelLarge),
                  SpaceUtils.vSpace10(),
                  Wrap(
                    children: buildSpecialtyFilterItem(context),
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedbuttonWidget(
                      onPressed: () {
                        widget.onApplyFilter!();
                        Navigator.pop(context);
                      },
                      text: TranslateUtils.of(context).translate(
                          "tutor_screen.filter.type.specialties.btn_apply_filter")),
                  SpaceUtils.vSpace10(),
                  CustomTextButton.withText(
                      onPressed: () {
                        _mentorsScreenProvider.resetCriteria();
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
        .map((specialtyItem) => GestureDetector(
              onTap: () {
                setState(() {
                  _tutorSpecialty = specialtyItem;
                });
                _mentorsScreenProvider
                    .setSelectedSpecialtyFilter(specialtyItem);
              },
              child: Container(
                margin: EdgeInsets.all(2),
                child: Chip(
                  label: Text(
                      TranslateUtils.of(context)
                              ?.translateEnum<TutorSpecialty>(specialtyItem) ??
                          '',
                      style: AppConst.textTheme.titleSmall?.apply(
                          color: _tutorSpecialty == specialtyItem
                              ? AppColors.primary
                              : AppColors.non_select)),
                  backgroundColor: _tutorSpecialty == specialtyItem
                      ? AppColors.lightBleu
                      : AppColors.fillGrey,
                ),
              ),
            ))
        .toList();
  }

  void resetFilter() {
    setState(() {
      _tutorSpecialty = TutorSpecialty.ALL;
    });
  }
}
