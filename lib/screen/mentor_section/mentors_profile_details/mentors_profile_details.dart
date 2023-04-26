import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_consts.dart';
import '../../../utils/widget_utils.dart';
import '../../../widgets/calendar_timeline/calendar_timeline.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text.dart';
import 'mentors_profile_details_provider.dart';

class MentorsProfile extends StatefulWidget {
  // final User? users;
  final users;

  const MentorsProfile({Key? key, this.users}) : super(key: key);

  @override
  State<MentorsProfile> createState() => _MentorsProfileState();
}

class _MentorsProfileState extends State<MentorsProfile>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MentorsProfileDetailsProvider(widget.users),
      child: Consumer<MentorsProfileDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(appBarName: ''),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                height: 90.h,
                                fit: BoxFit.cover,
                                imageUrl:
                                    "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00",
                                placeholder: (context, url) => Center(
                                  child: Image.asset(
                                      "assets/home_page/ic_no_image.png"),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomText(
                              text: 'Keegan',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.title,
                            ),
                            SpaceUtils.vSpace(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flag.fromString("VN", height: 24, width: 24),
                                SpaceUtils.hSpace(10),
                                CustomText(
                                  text: "Vietnam",
                                )
                              ],
                            ),
                            SpaceUtils.vSpace10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: AppColors.warning),
                                SpaceUtils.hSpace10(),
                                CustomText(
                                  text: "5.0 • 235 ratings",
                                  color: AppColors.hintTextColor,
                                )
                              ],
                            ),
                            SpaceUtils.vSpace(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    icon: const Icon(
                                        Icons.manage_search_rounded,
                                        size: 30),
                                    onPressed: () {},
                                    color: AppColors.primary),
                                IconButton(
                                    icon: const Icon(
                                        Icons.chat_bubble_outline_rounded,
                                        size: 30),
                                    onPressed: () {},
                                    color: AppColors.primary),
                                IconButton(
                                    icon: const Icon(
                                        Icons.play_circle_outline_rounded,
                                        size: 30),
                                    onPressed: () {},
                                    color: AppColors.primary),
                              ],
                            ),
                            SpaceUtils.vSpace10(),
                            CustomTextButton(
                              text: CustomText(
                                text: "Add to favorite",
                              ),
                              onPressed: () {},
                              styleButton: StyleButton(
                                  outlineColor: Colors.transparent,
                                  width: double.infinity),
                              alignment: Alignment.center,
                            ),
                            Container(
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: AppColors.lightBleu),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: CalendarTimeline(
                                    showYears: true,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now()
                                        .subtract(Duration(days: 3)),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365 * 1)),
                                    onDateSelected: (date) => {},
                                    selectableDayPredicate: (day) {
                                      return !day.isBefore(DateTime.now()
                                          .subtract(Duration(days: 1)));
                                    },
                                    leftMargin: 20,
                                    monthColor: AppColors.title,
                                    dayColor: AppColors.primary,
                                    dayNameColor: AppColors.white,
                                    activeDayColor: Colors.white,
                                    activeBackgroundDayColor: AppColors.primary,
                                    dotsColor: const Color(0xFF333A47),
                                    locale: 'vi'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
