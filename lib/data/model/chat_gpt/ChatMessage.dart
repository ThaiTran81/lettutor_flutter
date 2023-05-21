import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';


enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

enum ChatRole {
  ASSISTANT(code: 'assistant'),
  USER(code: 'user');

  final String code;

  const ChatRole({required this.code});
}

final Uuid uuid = Uuid();

class ChatMessage extends HiveObject {
  String id = uuid.v1();

  String text;

  String chatRole;

  bool isSender;

  DateTime createdTime = DateTime.now();

  ChatMessage({
    this.text = '',
    required this.chatRole,
    required this.isSender,
  });
}

List demeChatMessages = [
  ChatMessage(
    text: "Hi Sajol,",
    chatRole: ChatRole.ASSISTANT.code,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    chatRole: ChatRole.USER.code,
    isSender: true,
  )
];
