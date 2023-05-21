import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/model/chat_gpt/ChatMessage.dart';
import 'package:lettutor_thaitran81/data/network/apis/openai/openai_repository.dart';

class ChatGptScreenProvider extends ChangeNotifier {

  List<ChatMessage> chatList = [];
  List<ChatMessage> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    var message = ChatMessage(
        chatRole: ChatRole.USER.code, isSender: true, text: msg);
    addMessage(message);
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(String msg) async {
    String message = await OpenAIApi.sendMessage(chatList);
    addAssistantMessage(message);
    notifyListeners();
  }

  ChatMessage addAssistantMessage(String content) {
    var chatMessage = ChatMessage(
        chatRole: ChatRole.ASSISTANT.code, isSender: false, text: content);
    addMessage(chatMessage);
    return chatMessage;
  }

  void addMessage(ChatMessage chatMessage) {
    chatList.add(chatMessage);
    notifyListeners();
  }

}
