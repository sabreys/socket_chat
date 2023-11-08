import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_chat/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:socket_chat/services/socket_service.dart';
import 'package:socket_chat/services/channel_service.dart';
import 'package:socket_chat/services/cache_service.dart';
import 'package:socket_chat/services/user_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SocketService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ChannelService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CacheService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterSocketService();
  getAndRegisterChannelService();
  getAndRegisterCacheService();
  getAndRegisterUserService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockSocketService getAndRegisterSocketService() {
  _removeRegistrationIfExists<SocketService>();
  final service = MockSocketService();
  locator.registerSingleton<SocketService>(service);
  return service;
}

MockChannelService getAndRegisterChannelService() {
  _removeRegistrationIfExists<ChannelService>();
  final service = MockChannelService();
  locator.registerSingleton<ChannelService>(service);
  return service;
}

MockCacheService getAndRegisterCacheService() {
  _removeRegistrationIfExists<CacheService>();
  final service = MockCacheService();
  locator.registerSingleton<CacheService>(service);
  return service;
}

MockUserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
