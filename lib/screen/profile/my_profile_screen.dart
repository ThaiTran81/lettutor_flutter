import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/profile/widget/profile_avatar.dart';
import 'package:lettutor_flutter/screen/profile/widget/profile_text_option.dart';
import 'package:lettutor_flutter/screen/profile/widget/text_outlined_button.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/custom_app_bar.dart';
import 'package:lettutor_flutter/widgets/light_background/darkRadialBackground.dart';
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
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
              child: Stack(children: [
                LightRadialBackground(
                  color: AppColors.primaryBg,
                  position: "topLeft",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          ProfileAvatar(
                              color: AppColors.primary,
                              scale: 4.0,
                              image: _authProvider.getUserAvatarUrl()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_authProvider.getUserFullname()!,
                                style: GoogleFonts.lato(
                                    color: AppColors.primary,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(_userData?.email ?? '',
                              style: GoogleFonts.lato(
                                  color: AppColors.textColor, fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: OutlinedButtonWithText(
                                width: 75, content: "Edit", onPressed: () {}),
                          ),
                          WidgetUtils.vSpace10(),
                          Column(
                            children: [
                              WidgetUtils.vSpace10(),
                              ProfileTextOption(
                                label: '$tabSpace My Projects',
                                icon: Icons.cast,
                                margin: 5.0,
                              ),
                              WidgetUtils.vSpace10(),
                              ProfileTextOption(
                                label: '$tabSpace Join A Team',
                                icon: Icons.group_add,
                                margin: 5.0,
                              ),
                              WidgetUtils.vSpace10(),
                              ProfileTextOption(
                                label: '$tabSpace Share Profile',
                                icon: Icons.shape_line_outlined,
                                margin: 5.0,
                              ),
                              WidgetUtils.vSpace10(),
                              ProfileTextOption(
                                label: '$tabSpace All My Task',
                                icon: Icons.check_circle_outline,
                                margin: 5.0,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]))),
    );
  }
}
