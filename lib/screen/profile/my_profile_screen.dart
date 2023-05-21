import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/auth/login_screen/login_screen.dart';
import 'package:lettutor_flutter/screen/profile/change_language_screen/ChangeLanguageScreen.dart';
import 'package:lettutor_flutter/screen/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:lettutor_flutter/screen/profile/widget/profile_avatar.dart';
import 'package:lettutor_flutter/screen/profile/widget/setting_item.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/nav_utils.dart';
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
  late UserData? _userData;

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
                  title: Text(_authProvider.getUserFullname() ?? '',
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
                      label: TranslateUtils.of(context)
                          .translate("setting_view_feedbacks"),
                      icon: Icons.person_outline_rounded,
                      margin: 5.0,
                      onTap: () {
                        print('on tapp');
                      },
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: TranslateUtils.of(context)
                          .translate("setting_booking_history"),
                      icon: Icons.history_toggle_off_rounded,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: TranslateUtils.of(context)
                          .translate("setting_session_history"),
                      icon: Icons.history_rounded,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: TranslateUtils.of(context)
                          .translate("setting_change_language"),
                      icon: Icons.abc_rounded,
                      margin: 5.0,
                      onTap: () {
                        _onChangeLanguageClick(context);
                      },
                    ),
                    SpaceUtils.vSpace10(),
                    SettingItem(
                      label: TranslateUtils.of(context)
                          .translate("setting_advanced"),
                      icon: Icons.settings_outlined,
                      margin: 5.0,
                    ),
                    SpaceUtils.vSpace(40),
                    SettingItem(
                      label: TranslateUtils.of(context)
                          .translate("setting_our_web"),
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
                        text: TranslateUtils.of(context)
                            .translate("setting_btn_log_out"),
                        onPressed: () {
                          NavUtil.pushAndRemoveUntil(context, LogInScreen());
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

  void _onChangeLanguageClick(BuildContext context) {
    NavUtil.navigateScreen(context, ChangeLanguageScreen());
  }
}
