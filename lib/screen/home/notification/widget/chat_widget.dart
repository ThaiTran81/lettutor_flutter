
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/model/chat_gpt/ChatMessage.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/asset_utils.dart';
import 'package:lettutor_thaitran81/widgets/cache_image.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget(
      {super.key,
        required this.msg,
        required this.chatRole,
        this.shouldAnimate = false,
        this.imageUrl
      });

  final String msg;
  final bool shouldAnimate;
  final ChatRole chatRole;
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatRole == ChatRole.USER ? AppColors.scaffoldBackgroundColor : AppColors.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                chatRole == ChatRole.ASSISTANT           ?
                Image.asset(
                  AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ) : CacheImage(url: imageUrl ?? '', height: 30, width: 30,),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatRole == ChatRole.USER
                      ? TextWidget(
                    label: msg,
                  )
                      : shouldAnimate
                      ? DefaultTextStyle(
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            msg.trim(),
                          ),
                        ]),
                  )
                      : Text(
                    msg.trim(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
                chatRole == ChatRole.USER
                    ? const SizedBox.shrink()
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
