import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lettutor_thaitran81/data/model/chat_gpt/ChatMessage.dart';
import 'package:lettutor_thaitran81/provider/auth_provider.dart';
import 'package:lettutor_thaitran81/screen/home/notification/widget/chat_widget.dart';
import 'package:lettutor_thaitran81/screen/home/notification/widget/text_widget.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_app_bar.dart';
import 'chat_gpt_screen_provider.dart';

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({super.key});

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;
  late AuthProvider _authProvider;
  late String avatarUrl = '';

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _authProvider = Provider.of<AuthProvider>(context);
    avatarUrl = _authProvider.getUserAvatarUrl() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatGptScreenProvider(),
      child: Consumer<ChatGptScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(
                appBarName: 'Chat GPT',
                backgroundColor: AppColors.scaffoldBackgroundColor,
                appBarNameColor: AppColors.lightBleu,
              ),
            ),
            backgroundColor: AppColors.scaffoldBackgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        controller: _listScrollController,
                        itemCount: provider.getChatList.length,
                        //chatList.length,
                        itemBuilder: (context, index) {
                          return ChatWidget(
                            msg: provider.getChatList[index].text,
                            // chatList[index].msg,
                            chatRole: provider.getChatList[index].chatRole ==
                                    ChatRole.USER.code
                                ? ChatRole.USER
                                : ChatRole.ASSISTANT,
                            //chatList[index].chatIndex,
                            shouldAnimate:
                                provider.getChatList.length - 1 == index,
                            imageUrl: avatarUrl,
                          );
                        }),
                  ),
                  if (_isTyping) ...[
                    const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: AppColors.cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              focusNode: focusNode,
                              style: const TextStyle(color: Colors.white),
                              controller: textEditingController,
                              onSubmitted: (value) async {
                                await sendMessage(provider);
                              },
                              decoration: const InputDecoration.collapsed(
                                  hintText: "How can I help you",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await sendMessage(provider);
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String generateResponse(String input) {
    // Replace this with your AI or chatbot logic to generate a response
    // This is just a placeholder response
    return 'This is a response from ChatGPT!';
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessage(ChatGptScreenProvider provider) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        provider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await provider.sendMessageAndGetAnswers(msg);
      // chatList.addAll(await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel,
      // ));
      setState(() {});
    } catch (error) {
      print("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}
