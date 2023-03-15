import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/course/course_screen_provider.dart';
import 'package:lettutor_flutter/screen/course/widget/course_list_view.dart';
import 'package:provider/provider.dart';

import '../../utils/app_consts.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CourseScreenProvider(),
      child: Consumer<CourseScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 16.w),
                              hintText: "Enter course's name",
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
                      Image.asset(
                        'assets/home_page/payment/filter_Icon.png',
                        height: 47,
                      )
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    height: 30,
                    child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: AppColors.primary,
                        labelStyle: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w700),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5)),
                        controller: _tabController,
                        onTap: (int index) {
                          provider.selectTab(index);
                        },
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: const Text("Course"),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: const Text("E-Book"),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: const Text("Interactive E-book"),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          CourseListView(),
                          CourseListView(),
                          CourseListView(),
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
