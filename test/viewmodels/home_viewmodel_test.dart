import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_chat/app/app.locator.dart';
import 'package:socket_chat/app/app.router.dart';
import 'package:socket_chat/models/Channel.dart';
import 'package:socket_chat/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';



void main() {
  setUp(  registerServices);
  tearDown(() => locator.reset());


  group('HomeViewModel Test -', () {
    test('When navigateToChat is called, it should navigate to ChatView using NavigationService', () async {
      // Arrange
      final mockNavigationService = getAndRegisterNavigationService();
      final homeViewModel = HomeViewModel();
      final testChannel = Channel(title: 'Testing', description: 'Testing channel', path: 'test-path');

      // Act
      homeViewModel.navigateToChat(testChannel);

      // Assert
      verify(mockNavigationService.navigateToChatView(
        channel: testChannel,
      )).called(1);
    });

  });
}


