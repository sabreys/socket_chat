import 'package:stacked/stacked.dart';
import 'package:socket_chat/app/app.locator.dart';
import 'package:socket_chat/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/cache_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _cacheService = locator<CacheService>();
  Future runStartupLogic() async {
    _navigationService.replaceWithLoginView();
  }
}
