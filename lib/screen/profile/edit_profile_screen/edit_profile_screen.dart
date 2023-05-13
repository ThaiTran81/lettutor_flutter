import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor_flutter/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_flutter/data/model/user/StudyLevel.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/profile/my_profile_provider.dart';
import 'package:lettutor_flutter/screen/profile/widget/basic_info_content.dart';
import 'package:lettutor_flutter/screen/profile/widget/password_content.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/cache_image.dart';
import 'package:lettutor_flutter/widgets/custom_app_bar.dart';
import 'package:lettutor_flutter/widgets/custom_text.dart';
import 'package:path_provider/path_provider.dart';
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
  late UserData _userData;
  XFile? _selectedAvatar;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _authProvider = Provider.of<AuthProvider>(context);
    _userData = _authProvider.getUserData()!;
  }

  @override
  Widget build(BuildContext context) {
    var avatarImage = _selectedAvatar?.path == null
        ? CacheImage(
            url: _userData.avatar!,
            height: 100,
            width: 100,
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.file(File(_selectedAvatar!.path),
                width: 100, height: 100, fit: BoxFit.cover),
          );
    return ChangeNotifierProvider(
        create: (context) => MyProfileProvider(),
        child: Scaffold(
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
                    InkWell(
                      onTap: _onChangeAvatar,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: avatarImage),
                    ),
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
                      labelStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
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
                    child: TabBarView(controller: _tabController, children: [
                      buildBasicInfoContent(),
                      PasswordContent(),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  BasicInfoContent buildBasicInfoContent() {
    var learnTopic = _userData.learnTopics
        ?.map((learnTopic) =>
            TutorSpecialty.tutorSpecialtyOfCodeMap[learnTopic.key])
        .toSet();
    var testPreparations = _userData.testPreparations
        ?.map((testPreparation) =>
            TutorSpecialty.tutorSpecialtyOfCodeMap[testPreparation.key])
        .toSet();
    var infoFormData = BasicInfoFormData(
        name: _userData.name,
        dob: _userData.birthday != null
            ? DateTime.parse(_userData.birthday!)
            : null,
        country: _userData.country,
        phoneNumber: _userData.phone,
        studyLevel: StudyLevel.codeStudyLevelMap[_userData.level],
        specialities: learnTopic,
        testPreparations: testPreparations,
        studySchedule: _userData.studySchedule);
    return BasicInfoContent(basicInfoFormData: infoFormData);
  }

  _onChangeAvatar() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedAvatar = image;
    });
    final Directory tempDir = await getTemporaryDirectory();
    print(image?.path);
    print(tempDir.path);
  }
}
