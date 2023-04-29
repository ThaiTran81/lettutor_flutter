import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentors_screen/tutor_filter_screen.dart';
import 'package:lettutor_flutter/screen/mentor_section/utils/mentor_section_utils.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(
        vsync: this, length: MentorSectionUtils.initCategories(context).length);
    return ChangeNotifierProvider(
      create: (context) => MentorsScreenProvider(),
      child: Consumer<MentorsScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: GestureDetector(
              onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
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
                                hintText: "Enter tutor's name",
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
                                  provider.getTutorListByCriteria();
                                },
                                mentorsScreenProvider: provider,
                              ),
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
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
                    Expanded(
                        child: MentorCardList(onScrollToEnd: onScrollToEnd)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  onScrollToEnd() {}
}
