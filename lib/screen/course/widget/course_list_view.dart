import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/course/course_detail/course_detail_screen.dart';

import 'course_card.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 295.h,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemCount: 8,
      itemBuilder: (context, index) {
        // final data = mentorsResponse?.data?.users?[index];
        return CourseCard( onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetailScreen(),
              ));
        });
      },
    );
  }
}
