import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/app_session_manager_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sessionsManager = locator<AppSessionManagerService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    if (_sessionsManager.sessionManager.isSignedIn) {
      _navigationService.replaceWith(Routes.demopodLandingView);
    } else {
      _navigationService.replaceWith(Routes.loginViewView);
      // _navigationService.replaceWith(Routes.demopodLandingView);
    }
  }
}
