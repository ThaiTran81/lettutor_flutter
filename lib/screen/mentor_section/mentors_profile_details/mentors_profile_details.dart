import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_flutter/data/model/tutor/Tutor.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentors_profile_details/feedback_view.dart';
import 'package:lettutor_flutter/screen/mentor_section/widgets/tag.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_consts.dart';
import '../../../utils/widget_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text.dart';
import 'mentors_profile_details_provider.dart';

class MentorsProfile extends StatefulWidget {
  // final User? users;
  final Tutor tutorInfo;

  const MentorsProfile({Key? key, required this.tutorInfo}) : super(key: key);

  @override
  State<MentorsProfile> createState() => _MentorsProfileState();
}

class _MentorsProfileState extends State<MentorsProfile>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MentorsProfileDetailsProvider(widget.tutorInfo);
      },
      child: Consumer<MentorsProfileDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(appBarName: ''),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                                imageUrl: provider.tutor?.avatar ?? '',
                                placeholder: (context, url) => Center(
                                  child: Image.asset(
                                      "assets/home_page/ic_no_image.png"),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomText(
                              text: provider.tutor?.name,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.title,
                            ),
                            SpaceUtils.vSpace(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flag.fromString(provider.tutor?.country ?? '',
                                    height: 24, width: 24),
                                SpaceUtils.hSpace(10),
                                CustomText(
                                  text: I10nUtils.getCountryName(
                                      provider.tutor?.country ?? ''),
                                )
                              ],
                            ),
                            SpaceUtils.vSpace10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: AppColors.warning),
                                SpaceUtils.hSpace10(),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return FeedbackView(
                                            userId:
                                                provider.tutor?.userId ?? '');
                                      },
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0)),
                                      ),
                                      backgroundColor: Colors.white,
                                    );
                                  },
                                  child: Text(
                                    "${provider.tutorInforDetail?.rating?.toStringAsFixed(2) ?? 'No ratings'} • ${provider.tutorInforDetail?.totalFeedback ?? 0} ratings",
                                    style: AppConst.textTheme.labelSmall
                                        ?.apply(color: AppColors.primary),
                                  ),
                                )
                              ],
                            ),
                            SpaceUtils.vSpace(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    icon: const Icon(
                                        Icons.manage_search_rounded,
                                        size: 30),
                                    onPressed: () {},
                                    color: AppColors.primary),
                                IconButton(
                                    icon: const Icon(
                                        Icons.chat_bubble_outline_rounded,
                                        size: 30),
                                    onPressed: () {},
                                    color: AppColors.primary),
                                IconButton(
                                    icon: const Icon(
                                        Icons.play_circle_outline_rounded,
                                        size: 30),
                                    onPressed: () {},
                                    color: AppColors.primary),
                              ],
                            ),
                            Text(
                              provider.tutor?.bio ?? '',
                              style: AppConst.textTheme.bodyMedium,
                            ),
                            SpaceUtils.vSpace10(),
                            CustomTextButton(
                              text: CustomText(
                                text: "Book",
                              ),
                              onPressed: () {},
                              styleButton: StyleButton(
                                  outlineColor: Colors.transparent,
                                  width: double.infinity),
                              alignment: Alignment.center,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                buildLanguageSection(context, provider),
                                SpaceUtils.vSpace10(),
                                buildSpecialtiesSection(provider),
                                SpaceUtils.vSpace10(),
                                buildInterestSection(provider),
                                SpaceUtils.vSpace10(),
                                buildSuggestedCourseSection(provider),
                                SpaceUtils.vSpace10(),
                                buildTechingExperienceSection(provider)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column buildTechingExperienceSection(MentorsProfileDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Teaching experience", style: AppConst.textTheme.headlineMedium),
        Row(
          children: [
            SpaceUtils.hSpace5,
            Flexible(
              child: Text(
                provider.tutor?.experience ?? '',
                style: AppConst.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildSuggestedCourseSection(MentorsProfileDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Suggested courses", style: AppConst.textTheme.headlineMedium),
        if (provider.tutorInforDetail != null)
          ...?provider.tutorInforDetail?.user?.courses
              ?.map((course) => Row(
                    children: [
                      SpaceUtils.hSpace5,
                      InkWell(
                          child: Text(
                        course.name ?? '',
                        style: AppConst.textTheme.bodyMedium
                            ?.apply(color: AppColors.primary),
                      )),
                    ],
                  ))
              .toList()
      ],
    );
  }

  Column buildInterestSection(MentorsProfileDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Interests", style: AppConst.textTheme.headlineMedium),
        Row(
          children: [
            SpaceUtils.hSpace5,
            Flexible(
              child: Text(
                provider.tutor?.interests ?? '',
                style: AppConst.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildSpecialtiesSection(MentorsProfileDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Specialties", style: AppConst.textTheme.headlineMedium),
        buildSectionSpecialties(provider.tutor),
      ],
    );
  }

  Column buildLanguageSection(
      BuildContext context, MentorsProfileDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Languages", style: AppConst.textTheme.headlineMedium),
        Align(
          alignment: Alignment.centerLeft,
          child: Tag(
              text: LocaleNames.of(context)
                  ?.nameOf(provider.tutor?.languages ?? '')),
        ),
      ],
    );
  }

  Wrap buildSectionSpecialties(Tutor? tutorInfo) {
    return Wrap(direction: Axis.horizontal, children: [
      ...?tutorInfo?.specialties
          ?.map((specialty) => tagSpecialty(TutorSpecialty.from(specialty)))
          .toList()
    ]);
  }

  Widget tagSpecialty(TutorSpecialty tutorSpecialty) {
    return Tag(text: I10nUtils.translateFrom(tutorSpecialty, context));
  }
}
