import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/course/course_filter_screen.dart';
import 'package:lettutor_thaitran81/screen/course/course_screen_provider.dart';
import 'package:lettutor_thaitran81/screen/course/widget/course_list_view.dart';
import 'package:lettutor_thaitran81/screen/course/widget/ebook_list_view.dart';
import 'package:provider/provider.dart';

import '../../utils/app_consts.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
                          controller: provider.searchTextFieldController,
                          onChanged: (value) {
                            provider.getSearchValue();
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 16.w),
                              hintText: TranslateUtils.of(context)
                                  .translate("course_screen.search_field.hint"),
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
                        onTap: () {
                          _openFilter(context, provider);
                        },
                        child: Image.asset(
                          'assets/home_page/payment/filter_Icon.png',
                          height: 47,
                        ),
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
                              child: Text(TranslateUtils.of(context)
                                  .translate("course_screen.tab.course")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(TranslateUtils.of(context)
                                  .translate("course_screen.tab.ebook")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(TranslateUtils.of(context).translate(
                                  "course_screen.tab.interactive_book")),
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
                          CourseTabContent(),
                          EbookTabContent(),
                          CourseTabContent(),
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

  void _openFilter(BuildContext context, CourseScreenProvider provider) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CourseFilterScreen(
        onApplyFilter: () {
          // .getTutorListByCriteria();
        },
        courseScreenProvider: provider,
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0)),
      ),
      backgroundColor: Colors.white,
    );
  }
}
