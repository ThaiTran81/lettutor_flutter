import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/course/course_detail/course_detail_screen.dart';
import 'package:lettutor_thaitran81/screen/course/course_screen_provider.dart';
import 'package:provider/provider.dart';

import 'course_card.dart';

class CourseTabContent extends StatefulWidget {
  const CourseTabContent({Key? key}) : super(key: key);

  @override
  State<CourseTabContent> createState() => _CourseTabContentState();
}

class _CourseTabContentState extends State<CourseTabContent> {
  late CourseScreenProvider _courseScreenProvider;
  late ScrollController _scrollController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseScreenProvider = Provider.of<CourseScreenProvider>(context);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var dataList = _courseScreenProvider.courseResultList;
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 295.h,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final data = dataList[index];
        return CourseCard(
            title: data.name,
            description: data.description,
            imageUrl: data.imageUrl,
            bottomInfo: "${data.topics?.length} lessons",
            tag: I10nUtils.translateExperienceLevel(data.level ?? 0),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailScreen(data),
                  ));
            });
      },
    );
  }
}
