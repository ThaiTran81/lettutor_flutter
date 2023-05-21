import 'package:dio/dio.dart';
import 'package:lettutor_thaitran81/data/model/chat_gpt/ChatMessage.dart';

class OpenAIApi {
  static final dio = Dio();
  static const API_OPENAI =
      'https://chatgpt-mobile-server.herokuapp.com/api/v1/chat';

  static Future<String> sendMessage(List<ChatMessage> chatMessages) async {
    final response = await dio.post(API_OPENAI, data: {
      'messages': chatMessages
          .map((e) => {'role': e.chatRole, 'content': e.text})
          .toList()
    });
    String res = response.data != null ? response.data['message']['content'] : 'please try again, something wrong';
    return res;
  }
}
