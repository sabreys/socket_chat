import 'dart:convert';

import 'package:socket_chat/models/ChatMessage.dart';
import 'package:socket_chat/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../constants/keys.env.dart';
import 'package:socket_chat/services/cache_service.dart';

class SocketService with ListenableServiceMixin {
  SocketService() {
    listenToReactiveValues([messages]);
  }

  final CacheService _cacheService = CacheService();
  final UserService _userService = UserService();
  WebSocket? activeSocket;

  String? activeChannelId;

  List<ChatMessage> messages = [];

  connectSocket(String channelId) async {
    activeChannelId = channelId;
    createConnection(channelId);
    listenSocket();
  }


  Future<void> loadCachedMessages(String channelId) async {
    messages = await _cacheService.getMessages(channelId);
    notifyListeners();
  }

  void createConnection(String channelId) {
    activeSocket = WebSocket(Uri.parse('$baseUrl/$channelId/$apiKey/'));
  }

  void listenSocket() {
    activeSocket?.messages.listen((message) {
      messages.add(ChatMessage.fromJson(json.decode(message)));
      _cacheService.saveMessages(activeChannelId!, messages);
      notifyListeners();
    });
  }

  createMessage(String message) {
    ChatMessage chatMessage = ChatMessage(
        message: message,
        sender: _userService.username,
        timestamp: DateTime.now().millisecondsSinceEpoch);
     sendMessage(chatMessage);
  }

  sendMessage( ChatMessage message) {
     emitMessage(message);
    _cacheService.saveMessages(activeChannelId!, messages);
    messages.add(message);
    notifyListeners();
  }

  emitMessage(ChatMessage message){
    activeSocket?.send(json.encode(message.toJson()));

  }

  closeSocket() {
    messages = [];
    activeSocket?.close();
    notifyListeners();
  }
}
