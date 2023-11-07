import 'package:socket_chat/app/app.bottomsheets.dart';
import 'package:socket_chat/app/app.dialogs.dart';
import 'package:socket_chat/app/app.locator.dart';
import 'package:socket_chat/app/app.router.dart';
import 'package:socket_chat/models/Channel.dart';
import 'package:socket_chat/services/channel_service.dart';
import 'package:socket_chat/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _channelService = locator<ChannelService>();
  final _navigationService = locator<NavigationService>();

  get channels => _channelService.channels;

  void navigateToChat(Channel channel){
     _navigationService.navigateToChatView(channel:channel);
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Socket Chat',
      description: 'Example dialog',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
