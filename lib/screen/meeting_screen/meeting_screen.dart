import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lettutor_flutter/screen/auth/widgets/elevated_button_widget.dart';
import 'package:lettutor_flutter/widgets/custom_app_bar.dart';

class VideoMeeting extends StatelessWidget {
  final String studentMeetingLink;

  const VideoMeeting({super.key, required this.studentMeetingLink});

  @override
  Widget build(BuildContext context) {
    return Meeting(
      studentMeetingLink: studentMeetingLink,
    );
  }
}

class Meeting extends StatefulWidget {
  final String studentMeetingLink;

  const Meeting({Key? key, required this.studentMeetingLink}) : super(key: key);

  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  bool isAudioMuted = true;
  bool isAudioOnly = false;
  bool isVideoMuted = true;
  int startTime = 0;
  int endSession = 0;
  int timeInRoom = 0;
  String roomName = '';
  String imgUrl = '';
  String name = '';

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(widget.studentMeetingLink);
    roomName = decodedToken['roomName'] ?? '';
    imgUrl = decodedToken['userCall']['avatar'] ?? '';
    name = decodedToken['userCall']['name'] ?? '';
    startTime = decodedToken['startTime'] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(appBarName: 'Meet Setting'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: buildMeetConfig(),
      ),
    );
  }

  Widget buildMeetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16.0),
          SwitchListTile(
            title: const Text("Audio Muted"),
            value: isAudioMuted,
            onChanged: _onAudioMutedChanged,
          ),
          const SizedBox(height: 16.0),
          SwitchListTile(
            title: const Text("Audio Only"),
            value: isAudioOnly,
            onChanged: _onAudioOnlyChanged,
          ),
          const SizedBox(height: 16.0),
          SwitchListTile(
            title: const Text("Video Muted"),
            value: isVideoMuted,
            onChanged: _onVideoMutedChanged,
          ),
          const Divider(height: 48.0, thickness: 2.0),
          SizedBox(
              height: 64.0,
              width: double.maxFinite,
              child: ElevatedbuttonWidget(
                text: "Continue",
                onPressed: _joinMeeting,
              )),
          const SizedBox(height: 48.0),
        ],
      ),
    );
  }

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value!;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value!;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value!;
    });
  }

  _joinMeeting() async {
    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomName,
      serverUrl: 'https://meet.lettutor.com',
      userAvatarUrl: imgUrl,
      isAudioMuted: isAudioMuted,
      isAudioOnly: isAudioOnly,
      isVideoMuted: isVideoMuted,
      userDisplayName: name,
    );

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
        },
        onAudioMutedChanged: (isMuted) {
          debugPrint("onAudioMutedChanged: isMuted: $isMuted");
        },
        onVideoMutedChanged: (isMuted) {
          debugPrint("onVideoMutedChanged: isMuted: $isMuted");
        },
        onScreenShareToggled: (participantId, isSharing) {
          debugPrint(
            "onScreenShareToggled: participantId: $participantId, "
            "isSharing: $isSharing",
          );
        },
        onParticipantJoined: (email, name, role, participantId) {
          debugPrint(
            "onParticipantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
        },
        onParticipantLeft: (participantId) {
          debugPrint("onParticipantLeft: participantId: $participantId");
        },
        onParticipantsInfoRetrieved: (participantsInfo, requestId) {
          debugPrint(
            "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
            "requestId: $requestId",
          );
        },
        onChatMessageReceived: (senderId, message, isPrivate) {
          debugPrint(
            "onChatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate",
          );
        },
        onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
        onClosed: () => debugPrint("onClosed"),
      ),
    );
  }
}
