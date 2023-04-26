import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/auth/login_screen/login_screen.dart';
import 'package:lettutor_flutter/screen/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:lettutor_flutter/screen/profile/widget/profile_avatar.dart';
import 'package:lettutor_flutter/screen/profile/widget/setting_item.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/nav_utils.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/custom_app_bar.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  final bool? isBottomNav;

  const MyProfileScreen({Key? key, this.isBottomNav}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final String tabSpace = "\t\t";
  late AuthProvider _authProvider;
  late User? _userData;

  @override
  void didChangeDependencies() {}

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    _userData = _authProvider.getUserData();
    return Scaffold(
      appBar: widget.isBottomNav == false
          ? PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(appBarName: 'Profile'),
            )
          : const PreferredSize(
              // ignore: sort_child_properties_last
              child: SizedBox(),
              preferredSize: Size.fromHeight(0)),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: ProfileAvatar(
                      color: AppColors.primary,
                      image: _authProvider.getUserAvatarUrl()),
                  title: Text(_authProvider.getUserFullname()!,
                      style: GoogleFonts.lato(
                          color: AppColors.primary,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(_userData?.email ?? '',
                      style: GoogleFonts.lato(
                          color: AppColors.textColor, fontSize: 14.sp)),
                  onTap: () {
                    NavUtil.navigateScreen(context, EditProfileScreen());
                  },
                ),
                SpaceUtils.vSpace10(),
                Column(
                  children: [
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: 'View Feedbacks',
                      icon: Icons.person_outline_rounded,
                      margin: 5.0,
                      onTap: () {
                        print('on tapp');
                      },
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: 'Booking History',
                      icon: Icons.history_toggle_off_rounded,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: 'Session History',
                      icon: Icons.history_rounded,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: 'Advanced Setting',
                      icon: Icons.settings_outlined,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace(40),
                    SettingItem(
                      label: 'Our Website',
                      icon: Icons.language_rounded,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: 'Facebook',
                      icon: Icons.facebook_rounded,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace(20),
                    CustomTextButton.withText(
                        text: "Log out",
                        onPressed: () {
                          SimpleWorker(
                                  task: NavUtil.pushAndRemoveUntil(
                                      context, LogInScreen()))
                              .start();
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
