import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/data/model/schedule/ScheduleData.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/screen/meeting_screen/meeting_screen.dart';
import 'package:lettutor_flutter/utils/date_utils.dart';
import 'package:lettutor_flutter/utils/nav_utils.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/cache_image.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';

import '../../../utils/app_consts.dart';
import '../../../widgets/custom_text.dart';
import '../schedule_screen.dart';

class ScheduleCard extends StatelessWidget {
  ScheduleData bookedClass;

  ScheduleCard(this.bookedClass, {super.key});

  @override
  Widget build(BuildContext context) {
    var scheduleDetailInfo = bookedClass.scheduleDetailInfo;
    var tutor = scheduleDetailInfo?.scheduleInfo?.tutorInfo;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: CacheImage(
                      url: tutor?.avatar ?? '',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: tutor?.name ?? '',
                        color: AppColors.title,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Flag.fromString(tutor?.country ?? '',
                          height: 25, width: 25),
                    ],
                  ),
                  Spacer(),
                  buildPopupMenuButton()
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: TranslateUtils.of(context)
                                .translate("schedule_screen.card.lesson_date"),
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: TranslateUtils.of(context)
                                .translate("schedule_screen.card.start_time"),
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: TranslateUtils.of(context)
                                .translate("schedule_screen.card.end_time"),
                            fontSize: 14.sp,
                            color: AppColors.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: scheduleDetailInfo?.startPeriodTimestamp !=
                                    null
                                ? DateTimeUtils.formatDateFrom(
                                    scheduleDetailInfo?.startPeriodTimestamp)
                                : '',
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: DateTimeUtils.formatToHour(
                                scheduleDetailInfo?.startPeriodTimestamp),
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: DateTimeUtils.formatToHour(
                                scheduleDetailInfo?.endPeriodTimestamp),
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                      flex: 5,
                      child: CustomTextButton(
                          text: CustomText(
                            text: TranslateUtils.of(context).translate(
                                "schedule_screen.card.btn_join_meeting"),
                          ),
                          alignment: Alignment.center,
                          onPressed: () => _goMeeting(context),
                          styleButton:
                              StyleButton(outlineColor: Colors.transparent))),
                  SizedBox(width: 5),
                  Flexible(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.danger),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Icon(
                          Icons.close_rounded,
                          color: AppColors.danger,
                        ),
                      )),
                ],
              )
            ],
          )),
    );
  }

  PopupMenuButton<SampleItem> buildPopupMenuButton() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Send message'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Send request'),
        )
      ],
      shape: RoundedRectangleBorder(borderRadius: SpaceUtils.commonRadius),
    );
  }

  _goMeeting(BuildContext context) async {
    var meetingLink = bookedClass.studentMeetingLink;
    NavUtil.navigateScreen(
        context,
        VideoMeeting(
          studentMeetingLink: meetingLink!,
        ));
    //   final base64Decoded = base64.decode(base64.normalize(
    //       bookedClass.studentMeetingLink?.split('token=')[1].split('.')[1] ??
    //           ''));
    //   final urlObject = utf8.decode(base64Decoded);
    //   final jsonRes = json.decode(urlObject);
    //   final String roomId = jsonRes['room'];
    //
    //   if (bookedClass.studentMeetingLink == null) return;
    //   await JitsiMeetWrapper.joinMeeting(
    //     options: JitsiMeetingOptions(
    //         roomNameOrUrl: bookedClass.userId!,
    //         serverUrl: 'https://meet.lettutor.com/',
    //         token: meetingLink?.split('token=')[1]),
    //     listener: JitsiMeetingListener(
    //       onConferenceWillJoin: (url) => print("onConferenceWillJoin: url: $url"),
    //       onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
    //       onConferenceTerminated: (url, error) =>
    //           print("onConferenceTerminated: url: $url, error: $error"),
    //     ),
    //   );
    // }
    //
    // _joinMeeting() async {
    //   var meetingLink = bookedClass.studentMeetingLink;
    //   var token = meetingLink?.split('token=')[1];
    //   AuthProvider authProvider = getIt.get<AuthProvider>();
    //   var userData = authProvider.userData;
    //   var options = JitsiMeetingOptions(
    //     roomNameOrUrl: bookedClass.userId!,
    //     serverUrl: 'https://meet.lettutor.com',
    //     token: token,
    //     userAvatarUrl: userData?.user?.avatar,
    //     // isAudioMuted: isAudioMuted,
    //     // isAudioOnly: isAudioOnly,
    //     // isVideoMuted: isVideoMuted,
    //     // userDisplayName: name,
    //   );
    //
    //   debugPrint("JitsiMeetingOptions: $options");
    //   await JitsiMeetWrapper.joinMeeting(
    //     options: options,
    //     listener: JitsiMeetingListener(
    //       onOpened: () => debugPrint("onOpened"),
    //       onConferenceWillJoin: (url) {
    //         debugPrint("onConferenceWillJoin: url: $url");
    //       },
    //       onConferenceJoined: (url) {
    //         debugPrint("onConferenceJoined: url: $url");
    //       },
    //       onConferenceTerminated: (url, error) {
    //         debugPrint("onConferenceTerminated: url: $url, error: $error");
    //       },
    //       onAudioMutedChanged: (isMuted) {
    //         debugPrint("onAudioMutedChanged: isMuted: $isMuted");
    //       },
    //       onVideoMutedChanged: (isMuted) {
    //         debugPrint("onVideoMutedChanged: isMuted: $isMuted");
    //       },
    //       onScreenShareToggled: (participantId, isSharing) {
    //         debugPrint(
    //           "onScreenShareToggled: participantId: $participantId, "
    //               "isSharing: $isSharing",
    //         );
    //       },
    //       onParticipantJoined: (email, name, role, participantId) {
    //         debugPrint(
    //           "onParticipantJoined: email: $email, name: $name, role: $role, "
    //               "participantId: $participantId",
    //         );
    //       },
    //       onParticipantLeft: (participantId) {
    //         debugPrint("onParticipantLeft: participantId: $participantId");
    //       },
    //       onParticipantsInfoRetrieved: (participantsInfo, requestId) {
    //         debugPrint(
    //           "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
    //               "requestId: $requestId",
    //         );
    //       },
    //       onChatMessageReceived: (senderId, message, isPrivate) {
    //         debugPrint(
    //           "onChatMessageReceived: senderId: $senderId, message: $message, "
    //               "isPrivate: $isPrivate",
    //         );
    //       },
    //       onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
    //       onClosed: () => debugPrint("onClosed"),
    //     ),
    //   );
  }
}
