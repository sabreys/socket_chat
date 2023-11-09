import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_chat/app/app.router.dart';

import 'package:socket_chat/services/user_service.dart';
import 'package:socket_chat/app/app.locator.dart';
import 'package:socket_chat/ui/views/login/login_viewmodel.dart';
import '../helpers/mock_context.dart';
import '../helpers/test_helpers.dart';



void main() {
  group('LoginViewModelTest -', () {

    setUp(() {
      registerServices();
    });

    tearDown(() {
      locator.reset();
    });

    test('When login is called with valid username, it should set username in UserService and navigate', () async {
      // Arrange
      final navigationService = getAndRegisterNavigationService();
      final userService = getAndRegisterUserService();
      final loginViewModel = LoginViewModel();
      // Act: Providing a username and calling login
      loginViewModel.username = 'testuser';
      loginViewModel.login(MockBuildContext());
      // Assert
      verify(userService.username = 'testuser').called(1);
      verify(navigationService.replaceWithHomeView()).called(1);
    });
  });
}