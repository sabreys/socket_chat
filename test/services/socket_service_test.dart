import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_chat/app/app.locator.dart';
import 'package:socket_chat/models/ChatMessage.dart';
import 'package:socket_chat/services/cache_service.dart';
import 'package:socket_chat/services/socket_service.dart';
import 'package:socket_chat/services/user_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('SocketService Tests', () {
    late SocketService socketService;
    late CacheService mockCacheService;
    late UserService mockUserService;

    setUp(() {
      registerServices();
      mockCacheService = CacheService();
      mockUserService = getAndRegisterUserService();
      socketService = SocketService();
    });

    test('Should connect and listen to socket', () async {
      const channelId = '11111';

      await socketService.connectSocket(channelId);

      expect(socketService.activeSocket, isNotNull);
    });

    test('Should close the socket', () {
      socketService.closeSocket();
      expect(socketService.activeSocket, isNull);
    });
  });
}
