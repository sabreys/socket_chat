import 'package:flutter_test/flutter_test.dart';
import 'package:socket_chat/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ChannelServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}