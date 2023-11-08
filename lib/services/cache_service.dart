import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_chat/models/ChatMessage.dart';

class CacheService {
  Future<List<ChatMessage>> getMessages(String channelId) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(channelId) ?? '[]';
    Iterable jsonMap = json.decode(jsonString);
    print(jsonString);
    return List<ChatMessage>.from(
        jsonMap.map((model) => ChatMessage.fromJson(model)));
  }

  void saveMessages(String channelId, List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        json.encode(messages.map((message) => message.toJson()).toList());
    var res = await prefs.setString(channelId, jsonString);
    print(res);
  }
}
