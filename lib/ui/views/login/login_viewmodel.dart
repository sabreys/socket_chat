import 'package:flutter/cupertino.dart';
import 'package:socket_chat/app/app.router.dart';
import 'package:socket_chat/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  String? _username;

  String? get username => _username;

  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  void login(BuildContext context) {
       _userService.username = _username;
      _navigationService.replaceWithHomeView();
  }
}
