import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_chat/models/ChatMessage.dart';
import 'package:socket_chat/services/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/test_helpers.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CacheService Tests', () {
    late MockSharedPreferences mockSharedPreferences;
    late CacheService cacheService;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      SharedPreferences.setMockInitialValues({});
      cacheService = CacheService();
    });

    test('getMessages should retrieve and deserialize messages', () async {
      const testChannelId = 'test_channel';
      const mockMessagesJson =
          '[{"content":"Test Message","senderId":"1","timestamp":"2023-01-01T12:00:00.000Z"}]';

      await cacheService.saveMessages(testChannelId, [
        ChatMessage(
            message: 'Test Message',
            sender: '1',
            timestamp: DateTime(2023, 1, 1).millisecondsSinceEpoch)
      ]);

      expect((await cacheService.getMessages(testChannelId)).first.message,
          equals('Test Message'));
    });
  });
}
