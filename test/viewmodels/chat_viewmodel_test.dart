import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_chat/app/app.locator.dart';
import 'package:socket_chat/models/Channel.dart';
import 'package:socket_chat/models/ChatMessage.dart';
import 'package:socket_chat/ui/views/chat/chat_viewmodel.dart';

import '../helpers/test_helpers.dart';


void main() {
  setUp(() {
    registerServices();
  });

  tearDown(() {
    locator.reset();
  });

  group('ChatViewModel Tests -', () {
    test('ViewModel should connect to the socket and load cached messages on initialization', () async {
      // Arrange
      final mockSocketService = getAndRegisterSocketService();
      when(mockSocketService.connectSocket(any)).thenAnswer((_) async {});
      when(mockSocketService.loadCachedMessages(any)).thenAnswer((_) async {});
      final chatViewModel = ChatViewModel(Channel(path: 'testChannel'));

   
      verify(mockSocketService.connectSocket('testChannel')).called(1);
      verify(mockSocketService.loadCachedMessages('testChannel')).called(1);
    });

    test('When sendMessage is called, it should use the socket service to send the message and clear inputController', () async {
      // Arrange
      var messageToSend = 'test message';
      final mockSocketService = getAndRegisterSocketService();
      final chatViewModel = ChatViewModel(Channel(path: 'testChannel'));
      chatViewModel.inputController.text = messageToSend;

      
      chatViewModel.sendMessage();

   
      verify(mockSocketService.createMessage(messageToSend)).called(1);
      expect(chatViewModel.inputController.text, isEmpty);
    });

    test('isMe should return true for messages sent by the current user', () {
      // Arrange
      final userService = getAndRegisterUserService();
      when(userService.username).thenReturn('testUser');
      final chatViewModel = ChatViewModel(Channel(path: 'testChannel'));
      final testMessage = ChatMessage(sender: 'testUser', message: 'Hello');

      
      final result = chatViewModel.isMe(testMessage.sender);

   
      expect(result, isTrue);
    });

    test('isMe should return false for messages not sent by the current user', () {
      // Arrange
      final userService = getAndRegisterUserService();
      when(userService.username).thenReturn('testUser');
      final chatViewModel = ChatViewModel(Channel(path: 'testChannel'));
      final testMessage = ChatMessage(sender: 'anotherUser', message: 'Hello');

      
      final result = chatViewModel.isMe(testMessage.sender);

   
      expect(result, isFalse);
    });

    test('dispose should disconnect the socket and clear messages', () {
      // Arrange
      final mockSocketService = getAndRegisterSocketService();
      final chatViewModel = ChatViewModel(Channel(path: 'testChannel'));

      
      chatViewModel.dispose();

   
      verify(mockSocketService.closeSocket()).called(1);
      expect(chatViewModel.messages.length, 0);
    });



  });
}

