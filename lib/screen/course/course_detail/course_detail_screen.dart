import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/course/course_detail/course_detail_screen_provider.dart';
import 'package:lettutor_flutter/screen/course/pdfScreen/pdf_screen.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';
import 'package:lettutor_flutter/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../utils/widget_utils.dart';
import '../../../widgets/custom_app_bar.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                              color: AppColors.white),
                          height: 300.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://images.pexels.com/photos/15954341/pexels-photo-15954341.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
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
                                text: "This is course title",
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: AppColors.primary,
                              ),
                              SpaceUtils.vSpace(30),
                              _buildSectionIntroduce("Overview",
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor."),
                              SpaceUtils.vSpace(20),
                              _buildSectionIntroduce("Experience",
                                  "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor."),
                              SpaceUtils.vSpace(20),
                              _buildSectionIntroduce("List topics", ""),
                              ..._mockTopic.map((e) => _buildLessonItem(e))
                                  .toList()
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

  Widget _buildLessonItem(String lessonName) {
    return CustomButton(
      child: Row(
        children: [
          Icon(Icons.picture_as_pdf_rounded, color: AppColors.subTiltle),
          SpaceUtils.hSpace10(),
          CustomText(text: lessonName, color: AppColors.subTiltle,)
        ],
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfScreen(),
            ));
      },
      styleButton: StyleButton(
        outlineColor: Colors.transparent,
        fillColor: AppColors.fillGrey
      ),
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
