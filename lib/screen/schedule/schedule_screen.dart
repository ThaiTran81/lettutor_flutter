import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/schedule/schedule_provider.dart';
import 'package:lettutor_flutter/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_consts.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ScheduleProvider(),
        child: Consumer<ScheduleProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Card(
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
                              PopupMenuButton(
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<SampleItem>>[
                                  const PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemOne,
                                    child: Text('Item 1'),
                                  ),
                                  const PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemTwo,
                                    child: Text('Item 2'),
                                  ),
                                  const PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemThree,
                                    child: Text('Item 3'),
                                  ),
                                ],
                              )
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: Colors.transparent),
                                        elevation: 0.0,
                                        shadowColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        backgroundColor: AppColors.lightBleu),
                                    child: const SizedBox(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CustomText(
                                          text: 'Go meeting',
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                  flex: 1,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: AppColors.danger),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: const Icon(
                                      Icons.close_rounded,
                                      color: AppColors.danger,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
