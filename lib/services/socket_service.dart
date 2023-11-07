import 'dart:convert';

import 'package:socket_chat/models/ChatMessage.dart';
import 'package:stacked/stacked.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../constants/keys.env.dart';

class SocketService with ListenableServiceMixin{

  SocketService() {
    listenToReactiveValues([messages]);
  }

  WebSocket? activeSocket;

  List<ChatMessage> messages= [];

 connectSocket(String channelId){
    createConnection(channelId);
    listenSocket();
 }

 void createConnection(String channelId) {
   activeSocket = WebSocket(Uri.parse('$baseUrl/$channelId/$apiKey/'));
 }

 void listenSocket() {
   activeSocket?.messages.listen((message) {
     messages.add(ChatMessage.fromJson(json.decode(message)));
     notifyListeners();
   });
 }

 sendMessage(String message){
   ChatMessage chatMessage = ChatMessage(message: message, sender : "nick",timestamp:DateTime.now().millisecondsSinceEpoch);
   activeSocket?.send(json.encode(chatMessage.toJson()));
   messages.add(chatMessage);
   notifyListeners();
 }

closeSocket(){
   messages = [];
   activeSocket?.close();
   notifyListeners();
 }




}
