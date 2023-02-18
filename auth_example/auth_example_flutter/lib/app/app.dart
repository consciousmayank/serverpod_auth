import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/app_session_manager_service.dart';
import '../services/demopod_server_client_service.dart';
import '../ui/views/demopod_landing/demopod_landing_view.dart';
import '../ui/views/login_view/login_view_view.dart';
import '../ui/views/startup/startup_view.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: StartupView),

  MaterialRoute(page: DemopodLandingView),
  MaterialRoute(page: LoginViewView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: DemopodServerClientService),
  LazySingleton(classType: AppSessionManagerService),
// @stacked-service
])
class App {}
