import 'package:flutter/material.dart';
import 'package:socket_chat/models/ChatMessage.dart';
import 'package:socket_chat/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../../models/Channel.dart';
import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({Key? key, required this.channel}) : super(key: key);
  final Channel channel;

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 10,
                child: ListView.builder(
                  itemCount: viewModel.messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final message = viewModel.messages[index];
                    return Row(
                      mainAxisAlignment: viewModel.isMe(message.sender)
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: buildMessageContent(message,viewModel),
                          )),
                        ),
                      ],
                    );
                  },
                ),
              ),
              _buildMessageComposer(viewModel)
            ],
          ),
        ),
      ),
    );
  }

  Text buildMessageContent(ChatMessage message, ChatViewModel viewModel) => Text(
      "${ viewModel.isMe(message.sender)?   "" : "${message.sender!}:"} ${message.message!}");

  _buildMessageComposer(ChatViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: viewModel.inputController,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            onPressed: viewModel.sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel(channel);
}
