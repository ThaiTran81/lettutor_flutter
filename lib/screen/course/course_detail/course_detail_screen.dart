import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/data/model/course/course/CourseInfo.dart';
import 'package:lettutor_thaitran81/data/model/course/course/Topics.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/course/course_detail/course_detail_screen_provider.dart';
import 'package:lettutor_thaitran81/screen/course/pdfScreen/pdf_screen.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/widgets/custom_button.dart';
import 'package:lettutor_thaitran81/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../utils/widget_utils.dart';
import '../../../widgets/custom_app_bar.dart';

class CourseDetailScreen extends StatefulWidget {
  final CourseInfo courseInfo;

  const CourseDetailScreen(this.courseInfo, {Key? key}) : super(key: key);

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var courseInfo = widget.courseInfo;
    return ChangeNotifierProvider(
        create: (context) => CourseDetailScreenProvider(),
        child: Consumer<CourseDetailScreenProvider>(
            builder: (context, provider, _) {
          return SafeArea(
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70.h),
                  child: CustomAppBar(
                      appBarName: '', backgroundColor: Colors.transparent),
                ),
                    extendBodyBehindAppBar: true,
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                              borderRadius: SpaceUtils.commonRadius,
                              color: AppColors.bg2),
                          height: 300.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: courseInfo.imageUrl ?? '',
                              fit: BoxFit.cover,
                              height: 300.h,
                              placeholder: (context, url) => Center(
                                child: Image.asset(
                                    "assets/home_page/ic_no_image.png"),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                  "assets/home_page/ic_no_image.png"),
                            ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              CustomText(
                                text: courseInfo.name,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: AppColors.primary,
                              ),
                              Text(
                                courseInfo.description ?? '',
                                style: AppConst.textTheme.displaySmall,
                              ),
                              SpaceUtils.vSpace(30),
                              // -- Overview --
                              Text("Overview",
                                  style: AppConst.textTheme.headlineMedium),
                              _buildSectionIntroduce(
                                  "Why take this course?", courseInfo.reason),
                              SpaceUtils.vSpace(20),
                              // -- Experience Level --
                              Text("Experience Level",
                                  style: AppConst.textTheme.headlineMedium),
                              Text(
                                  I10nUtils.translateExperienceLevel(
                                      courseInfo.level ?? 0),
                                  style: AppConst.textTheme.labelMedium),

                              SpaceUtils.vSpace(20),
                              // -- list topic
                              Text("List topics",
                                  style: AppConst.textTheme.headlineMedium),
                              if (courseInfo.topics != null)
                                ...courseInfo.topics!
                                    .map((topic) => _buildLessonItem(topic))
                                    .toList(),
                              // ..._mockTopic.map((e) => _buildLessonItem(e))
                              //     .toList()
                            ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              );
            }));
  }

  Widget _buildSectionIntroduce(String? title, String? content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          text: title ?? "",
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.subTiltle,
        ),
        if (content != null && content.isNotEmpty) SpaceUtils.vSpace(10),
        CustomText(
          text: content ?? '',
          color: AppColors.hintTextColor,
          fontSize: 14.sp,
          maxLine: 20,
        )
      ],
    );
  }

  Widget _buildLessonItem(CourseTopic courseTopic) {
    return CustomButton(
      child: Row(
        children: [
          Icon(Icons.picture_as_pdf_rounded, color: AppColors.subTiltle),
          SpaceUtils.hSpace10(),
          CustomText(
            text: courseTopic.name,
            color: AppColors.subTiltle,
          )
        ],
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfScreen(
                nameFile: courseTopic.name ?? '',
                url: courseTopic.nameFile ?? '',
              ),
            ));
      },
      styleButton: StyleButton(
          outlineColor: Colors.transparent, fillColor: AppColors.fillGrey),
    );
  }

  List<String> _mockTopic = [
    "The Internet",
    "Artificial Intelligence",
    "Scocial Media",
    "Internet Privacy",
    "Live Streaming",
    "Coding",
    "Technology Transforming Healthcare"
  ];
}
