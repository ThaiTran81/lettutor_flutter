import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/profile/widget/basic_info_content.dart';
import 'package:lettutor_flutter/screen/profile/widget/password_content.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/cache_image.dart';
import 'package:lettutor_flutter/widgets/custom_app_bar.dart';
import 'package:lettutor_flutter/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late AuthProvider _authProvider;
  late User _userData;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    _userData = _authProvider.getUserData()!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(appBarName: 'Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: CacheImage(
                          url: _userData.avatar!,
                          height: 100,
                          width: 100,
                        )),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomText(
                      text: _userData.name,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.title,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      text: _userData.email,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.body,
                    ),
                    SpaceUtils.vSpace(24.h)
                  ],
                ),
              ),
              TabBar(
                  isScrollable: true,
                  unselectedLabelColor: AppColors.body,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  labelStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                  tabs: const [
                    Tab(
                      text: 'Basic Info',
                    ),
                    Tab(
                      text: 'Password',
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab),
              SizedBox(
                height: 470.h,
                child: TabBarView(controller: _tabController, children: const [
                  BasicInfoContent(),
                  PasswordContent(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
