import 'package:flutter/cupertino.dart';
import 'package:socket_chat/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'login_view.form.dart';

class LoginViewModel extends  FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  String? _username;

  String? get username => _username;

  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  void login(BuildContext context) {
    if (_username != null && _username!.isNotEmpty) {
      //todo: username will send to service
      _navigationService.replaceWithHomeView();
    }else{
      //todo: show error message
    }
  }

}