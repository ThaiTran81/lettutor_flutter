import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/data/model/tutor/Tutor.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentor_booking/mentor_booking_screen.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentors_profile_details/feedback_view.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentors_profile_details/widget/report_dialog.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/widgets/tag.dart';
import 'package:lettutor_thaitran81/utils/nav_utils.dart';
import 'package:lettutor_thaitran81/widgets/custom_button.dart';
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
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.tutorInfo.video ??
        "https://cdn.dribbble.com/userupload/6271442/file/large-3d9079c31c8d1c15b79887579bacecc1.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MentorsProfileDetailsProvider(widget.tutorInfo, context);
      },
      child: Consumer<MentorsProfileDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(
                appBarName: '',
                trailingChildren: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReportDialog(
                            title: "Report ${provider.tutor?.name}",
                            onSubmit: (message) {
                              provider.reportTutor(message);
                            },
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.outlined_flag_rounded),
                    color: AppColors.danger,
                  )
                ],
              ),
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
                                    "${provider.tutorInforDetail?.rating?.toStringAsFixed(2) ?? 'No ratings'} • ${provider.tutorInforDetail?.totalFeedback ?? 0} ${TranslateUtils.of(context).translate("tutor_detail_screen.rating_label")}",
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
                                  onPressed: () {
                                    provider.sendFavoriteTutor();
                                  },
                                  icon: Icon(
                                    provider.tutor?.isfavoritetutor ?? false
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_outlined,
                                    color: AppColors.danger,
                                  ),
                                ),
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
                                    onPressed: () {
                                      videoPlayerController.value.isPlaying
                                          ? videoPlayerController.pause()
                                          : videoPlayerController.play();
                                    },
                                    color: AppColors.primary),
                              ],
                            ),
                            SpaceUtils.vSpace10(),
                            CustomTextButton(
                              text: CustomText(
                                text: TranslateUtils.of(context)
                                    .translate("btn_book_tutor"),
                              ),
                              onPressed: () {
                                NavUtil.navigateScreen(
                                    context,
                                    MentorBookingScreen(
                                      name: widget.tutorInfo.name ?? '',
                                      tutorId: widget.tutorInfo.userId!,
                                    ));
                              },
                              styleButton: StyleButton(
                                  outlineColor: Colors.transparent,
                                  width: double.infinity),
                              alignment: Alignment.center,
                            ),
                            Center(
                              child: videoPlayerController.value.isInitialized
                                  ? Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.primary)),
                                      child:CustomVideoPlayer(
                                          customVideoPlayerController: _customVideoPlayerController
                                      ),)
                                  : Container(),
                            ),
                            SpaceUtils.vSpace10(),
                            Container(),
                            Text(
                              provider.tutor?.bio ?? '',
                              style: AppConst.textTheme.bodyMedium,
                            ),
                            SpaceUtils.vSpace10(),
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
        Text(
            TranslateUtils.of(context)
                .translate("tutor_detail_screen.interest_label"),
            style: AppConst.textTheme.headlineMedium),
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
        Text(
            TranslateUtils.of(context)
                .translate("tutor_detail_screen.specialties_label"),
            style: AppConst.textTheme.headlineMedium),
        buildSectionSpecialties(provider.tutor),
      ],
    );
  }

  Column buildLanguageSection(
      BuildContext context, MentorsProfileDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            TranslateUtils.of(context)
                .translate("tutor_detail_screen.language_label"),
            style: AppConst.textTheme.headlineMedium),
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
    return Tag(
        text: TranslateUtils.of(context)
            .translateEnum<TutorSpecialty>(tutorSpecialty));
  }
}
