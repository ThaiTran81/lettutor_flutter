import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/meeting_screen/meeting_screen.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentors_screen/tutor_filter_screen.dart';
import 'package:lettutor_thaitran81/utils/date_utils.dart';
import 'package:lettutor_thaitran81/utils/nav_utils.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';
import 'package:lettutor_thaitran81/widgets/CountDownTimer.dart';
import 'package:lettutor_thaitran81/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_consts.dart';
import '../widgets/mentors_card_list.dart';
import 'mentors_screen_provider.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({Key? key}) : super(key: key);

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  MentorsScreenProvider _mentorScreenProvider =
      getIt.get<MentorsScreenProvider>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabController =
        TabController(vsync: this, length: TutorSpecialty.values.length);
    return Scaffold(
      body: GestureDetector(
        onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildBanner(),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller:
                          _mentorScreenProvider.searchTextFieldController,
                      onChanged: (value) {
                        _mentorScreenProvider.getSearchValue();
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13.h, horizontal: 16.w),
                          hintText: TranslateUtils.of(context)
                              .translate("tutor_screen.search_field.hint_text"),
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: AppColors.title.withOpacity(0.3),
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.border),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Image.asset(
                              'assets/home_page/payment/Vector.png',
                              scale: 1.5,
                            ),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    child: Image.asset(
                      'assets/home_page/payment/filter_Icon.png',
                      height: 47,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => TutorFilterScreen(
                          onApplyFilter: () {
                            _mentorScreenProvider.getTutorListByCriteria();
                          },
                          mentorsScreenProvider: _mentorScreenProvider,
                        ),
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        backgroundColor: Colors.white,
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(child: MentorCardList(onScroll: _onScrollListener)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBanner() {
    _mentorScreenProvider.initializeData();
    return Consumer<MentorsScreenProvider>(
      builder: (context, provider, child) {
        var translateUtils = TranslateUtils.of(context);
        return Container(
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: AppColors.primaryBg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              provider.upcomingMeeting == null
                  ? Text(
                      translateUtils
                          .translate("tutor_screen.banner.no_upcoming_lesson"),
                      style: AppConst.textTheme.titleLarge
                          ?.apply(color: AppColors.white),
                    )
                  : buildUpcomingLessonShowInBanner(provider, context),
              Text(
                  "${translateUtils.translate("tutor_screen.banner.total_lesson_time")} ${formatTotalLessonHour(provider.totalLessonHour)}",
                  style: AppConst.textTheme.labelLarge
                      ?.apply(color: AppColors.white))
            ],
          ),
        );
      },
    );
  }

  Column buildUpcomingLessonShowInBanner(
      MentorsScreenProvider provider, BuildContext context) {
    return Column(
      children: [
        Text(
          TranslateUtils.of(context)
              .translate("tutor_screen.banner.upcoming_lesson"),
          style: AppConst.textTheme.titleLarge?.apply(color: AppColors.white),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${DateTimeUtils.formatDateFrom(provider.upcomingMeeting?.scheduleDetailInfo?.startPeriodTimestamp)} | ",
              style:
                  AppConst.textTheme.bodyLarge?.apply(color: AppColors.white),
            ),
            Text(
              "${DateTimeUtils.formatToHour(provider.upcomingMeeting?.scheduleDetailInfo?.startPeriodTimestamp)} "
              "- ${DateTimeUtils.formatToHour(provider.upcomingMeeting?.scheduleDetailInfo?.endPeriodTimestamp)}",
              style:
                  AppConst.textTheme.bodyLarge?.apply(color: AppColors.white),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpaceUtils.hSpace5,
            Text(
              "start in( ",
              style: AppConst.textTheme.labelLarge
                  ?.apply(color: AppColors.warning),
            ),
            CountDownTimer(
              key: ValueKey(provider.upcomingMeeting),
              seconds: DateTime.fromMicrosecondsSinceEpoch(
                      (provider.upcomingMeeting?.scheduleDetailInfo
                                  ?.startPeriodTimestamp ??
                              0) *
                          1000,
                      isUtc: true)
                  .toLocal()
                  .difference(DateTime.now())
                  .inSeconds,
              textStyle: AppConst.textTheme.labelLarge
                  ?.apply(color: AppColors.warning),
            ),
            Text(
              " )",
              style: AppConst.textTheme.labelLarge
                  ?.apply(color: AppColors.warning),
            ),
          ],
        ),
        CustomButton(
          child: Text(
              TranslateUtils.of(context)
                  .translate("tutor_screen.banner.btn_join_meeting"),
              style: TextStyle(fontSize: 14, color: AppColors.primary)),
          styleButton: StyleButton(radius: 20, fillColor: AppColors.lightBleu),
          onPressed: () => NavUtil.navigateScreen(
              context,
              VideoMeeting(
                  studentMeetingLink:
                      provider.upcomingMeeting?.studentMeetingLink ?? '')),
        ),
      ],
    );
  }

  String formatTotalLessonHour(int minutes) {
    int hour = minutes ~/ 60;
    int minute = minutes - hour * 60;
    return "$hour ${TranslateUtils.of(context).translate("tutor_screen.banner.total_lesson_time.hours")} $minute ${TranslateUtils.of(context).translate("tutor_screen.banner.total_lesson_time.minutes")}";
  }

  _onScrollListener(ScrollController scrollController) {}
}
