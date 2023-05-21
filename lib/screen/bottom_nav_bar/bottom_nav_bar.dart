import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/course/course_screen.dart';
import 'package:lettutor_thaitran81/screen/history/history_screen.dart';
import 'package:lettutor_thaitran81/screen/profile/my_profile_screen.dart';
import 'package:lettutor_thaitran81/screen/schedule/schedule_screen.dart';

import '../../utils/app_consts.dart';
import '../../widgets/new_app_bar.dart';
import '../home/notification/chat_gpt_screen.dart';
import '../mentor_section/mentors_screen/mentors_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int? bottomNavigationIndex;

  const BottomNavBar({Key? key, this.bottomNavigationIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  String? barName = "Home";
  int currentScreenIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CourseScreen(),
    MentorsScreen(),
    ScheduleScreen(),
    HistoryScreen(),
    MyProfileScreen(),

    // MyProfileScreen(isBottomNav: true),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      appBarName(selectedIndex);
    });
  }

  void appBarName(int radians) {
    switch (radians) {
      case 0:
        barName = TranslateUtils.of(context).translate("course_screen.title");
        break;
      case 1:
        barName = TranslateUtils.of(context).translate("tutor_screen.title");
        break;
      case 2:
        barName = TranslateUtils.of(context).translate("schedule_screen.title");
        break;
      case 3:
        barName = TranslateUtils.of(context).translate("history_screen.title");
        break;
      case 4:
        barName = TranslateUtils.of(context).translate("profile_title");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    // ignore: unused_local_variable
    final PageController myPage =
        PageController(initialPage: widget.bottomNavigationIndex ?? 0);
    return WillPopScope(
      onWillPop: () async {
        final differences = DateTime.now().difference(timeBackPressed);
        timeBackPressed = DateTime.now();
        if (differences >= const Duration(seconds: 2)) {
          String msg = "Press the back button to exit";
          Fluttertoast.showToast(
            msg: msg,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: NewAppBar(
            appBarName: barName,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatGptScreen(),
                  ));
            },
            onPressed: () {},
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(1, 1),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: BottomNavigationBar(
            elevation: 2,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: AppColors.primary),
            selectedItemColor: AppColors.primary,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? const Icon(
                        Icons.class_,
                        color: AppColors.primary,
                      )
                    : Icon(Icons.class_outlined, color: AppColors.non_select),
                label: TranslateUtils.of(context).translate("course_screen.title"),
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? Icon(Icons.groups, color: AppColors.primary)
                    : Icon(Icons.groups_outlined, color: AppColors.non_select),
                label: TranslateUtils.of(context).translate("tutor_screen.title"),
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? Icon(Icons.event_note, color: AppColors.primary)
                    : Icon(Icons.event_note_outlined,
                        color: AppColors.non_select),
                label: TranslateUtils.of(context).translate("schedule_screen.title"),
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? Icon(
                        Icons.watch_later_rounded,
                        color: AppColors.primary,
                      )
                    : Icon(Icons.watch_later_outlined,
                        color: AppColors.non_select),
                label: TranslateUtils.of(context).translate("history_screen.title"),
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 4
                    ? Image.asset(
                        'assets/home_page/bottom_profile_two.png',
                        height: 24.h,
                        width: 24.w,
                      )
                    : Image.asset(
                        'assets/home_page/bottom_profile_one.png',
                        height: 24.h,
                        width: 24.w,
                      ),
                label: TranslateUtils.of(context).translate("profile_title"),
              ),
            ],
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
