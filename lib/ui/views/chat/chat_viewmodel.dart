import 'package:flutter/material.dart';
import 'package:socket_chat/models/ChatMessage.dart';
import 'package:socket_chat/services/socket_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/Channel.dart';
import '../../../services/user_service.dart';

class ChatViewModel extends ReactiveViewModel {
  final _socketService = locator<SocketService>();
  final _userService = locator<UserService>();

  List<ChatMessage> get messages => _socketService.messages;

  late Channel channel;

  TextEditingController inputController = TextEditingController();

  ChatViewModel(this.channel) {
    _socketService.connectSocket(channel.path!);
    _socketService.loadCachedMessages(channel.path!);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_socketService];

  void sendMessage() {

    locator<SocketService>().createMessage(inputController.text);

    inputController.text = "";
  }

  @override
  void dispose() {
    _socketService.closeSocket();
    super.dispose();
  }

  isMe(String? sender) {
    return sender == _userService.username;
  }
}
