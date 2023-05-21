import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/data/model/user/StudyLevel.dart';
import 'package:lettutor_thaitran81/data/model/user/User.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/provider/auth_provider.dart';
import 'package:lettutor_thaitran81/screen/profile/my_profile_provider.dart';
import 'package:lettutor_thaitran81/screen/profile/widget/basic_info_content.dart';
import 'package:lettutor_thaitran81/screen/profile/widget/password_content.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';
import 'package:lettutor_thaitran81/widgets/cache_image.dart';
import 'package:lettutor_thaitran81/widgets/custom_app_bar.dart';
import 'package:lettutor_thaitran81/widgets/custom_text.dart';
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
    Widget avatar = ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: avatarImage);
    Widget avatarSection = Stack(children: [
      Positioned(child: Container(margin: EdgeInsets.all(15), child: avatar)),
      Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 20,
              color: Colors.white,
            ),
          ))
    ]);
    return ChangeNotifierProvider(
        create: (context) => MyProfileProvider(),
        child: Consumer<MyProfileProvider>(
          builder: (context, provider, child) => Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(
                  appBarName: TranslateUtils.of(context)
                      .translate("setting_edit_profile.title")),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
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
                            onTap: () => _onChangeAvatar(provider),
                            child: avatarSection,
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
                        tabs: [
                          Tab(
                            text: TranslateUtils.of(context).translate(
                                "setting_edit_profile.tab.basic_info"),
                          ),
                          Tab(
                            text: TranslateUtils.of(context)
                                .translate("setting_edit_profile.tab.password"),
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
        dob: _userData.birthday != null && _userData.birthday !='null'
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

  _onChangeAvatar(MyProfileProvider provider) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      List<int> imageBytes = await image.readAsBytes();
      provider.updateAvatar(imageBytes, image.name);
    }
    // setState(() {
    //   _selectedAvatar = image;
    // });
    final Directory tempDir = await getTemporaryDirectory();
    print(image?.path);
    print(tempDir.path);
  }
}
