import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/screen/course/course_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'course_card.dart';

class EbookTabContent extends StatefulWidget {
  const EbookTabContent({Key? key}) : super(key: key);

  @override
  State<EbookTabContent> createState() => _EbookTabContent();
}

class _EbookTabContent extends State<EbookTabContent> {
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
    var tabData = _courseScreenProvider.totalAndEbookTabData.second;
    var dataList = tabData?.dataList;
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 295.h,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemCount: dataList?.length,
      itemBuilder: (context, index) {
        final data = dataList![index];
        return CourseCard(
            title: data.name,
            description: data.description,
            imageUrl: data.imageUrl,
            tag: I10nUtils.translateExperienceLevel(data.level ?? 0),
            onTap: () async {
              final Uri _url = Uri.parse(data.fileUrl ?? '');
              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            });
      },
    );
  }
}
