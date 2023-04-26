import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';

import '../../../utils/app_consts.dart';
import '../../../widgets/custom_text.dart';
import '../schedule_screen.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Keegan",
                        color: AppColors.title,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Flag.fromString('VN', height: 25, width: 25),
                    ],
                  ),
                  Spacer(),
                  buildPopupMenuButton()
                ],
              ),
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
                            text: 'Lesson date:',
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: 'Start time:',
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: 'End time:',
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
                            text: 'Monday, 15th March, 2023',
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: '7:00',
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: '10:00',
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
                            text: "Go meeting",
                          ),
                          alignment: Alignment.center,
                          onPressed: () {},
                          styleButton:
                              StyleButton(outlineColor: Colors.transparent))),
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
                          Icons.close_rounded,
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
