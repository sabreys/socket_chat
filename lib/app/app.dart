import 'package:socket_chat/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:socket_chat/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:socket_chat/ui/views/home/home_view.dart';
import 'package:socket_chat/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:socket_chat/services/socket_service.dart';
import 'package:socket_chat/ui/views/login/login_view.dart';
import 'package:socket_chat/services/channel_service.dart';
import 'package:socket_chat/ui/views/chat/chat_view.dart';
import 'package:socket_chat/services/cache_service.dart';
import 'package:socket_chat/services/user_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ChatView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SocketService),
    LazySingleton(classType: ChannelService),
    LazySingleton(classType: CacheService),
    LazySingleton(classType: UserService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
