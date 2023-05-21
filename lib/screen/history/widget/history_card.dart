import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/data/model/schedule/ScheduleData.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/utils/date_utils.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/cache_image.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';

import '../../../utils/app_consts.dart';
import '../../../widgets/custom_text.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HistoryCard extends StatelessWidget {
  ScheduleData bookedClass;

  HistoryCard(this.bookedClass, {super.key});

  double _heightModal = 0.5;

  @override
  Widget build(BuildContext context) {
    var scheduleDetailInfo = bookedClass.scheduleDetailInfo;
    var tutorInfo = scheduleDetailInfo?.scheduleInfo?.tutorInfo;
    var avatar = tutorInfo?.avatar;
    return Card(
      color: AppColors.white.withOpacity(0.6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(children: [
                ClipOval(
                  child: CacheImage(
                    url: avatar ?? '',
                    height: 60,
                    width: 60,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: tutorInfo?.name ?? '',
                      color: AppColors.title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Flag.fromString(tutorInfo?.country ?? '',
                            height: 25, width: 25),
                        SpaceUtils.hSpace5,
                        CustomText(
                          text: LocaleNames.of(context)
                              ?.nameOf(tutorInfo?.country ?? ''),
                          color: AppColors.hintTextColor,
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                CustomButton(
                  child: Icon(Icons.more_horiz_rounded,
                      color: AppColors.hintTextColor),
                  styleButton: StyleButton(
                      fillColor: Colors.transparent,
                      outlineColor: Colors.transparent),
                )
              ]),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: TranslateUtils.of(context)
                                .translate("history_screen.card.lesson_date"),
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: TranslateUtils.of(context)
                                .translate("history_screen.card.start_time"),
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: TranslateUtils.of(context)
                                .translate("history_screen.card.end_time"),
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: DateTimeUtils.formatDateFrom(
                                scheduleDetailInfo?.startPeriodTimestamp),
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: DateTimeUtils.formatToHour(
                                scheduleDetailInfo?.startPeriodTimestamp),
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: DateTimeUtils.formatToHour(
                                scheduleDetailInfo?.endPeriodTimestamp),
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                      flex: 5,
                      child: CustomTextButton(
                          text: CustomText(
                            text: "Leave a rating",
                            color: AppColors.white,
                          ),
                          alignment: Alignment.center,
                          onPressed: () {},
                          styleButton: StyleButton(
                              outlineColor: Colors.transparent,
                              fillColor: AppColors.warning.withOpacity(0.7)))),
                  SizedBox(width: 5),
                  Flexible(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.danger),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Icon(
                          Icons.report_problem_rounded,
                          color: AppColors.danger,
                        ),
                      )),
                ],
              )
            ],
          )),
    );
  }

  PopupMenuButton<SampleItem> buildPopupMenuButton() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Send message'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Send request'),
        )
      ],
      shape: RoundedRectangleBorder(borderRadius: SpaceUtils.commonRadius),
    );
  }
}
