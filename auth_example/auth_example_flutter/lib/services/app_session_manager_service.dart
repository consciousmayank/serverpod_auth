import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../app/app.locator.dart';
import 'demopod_server_client_service.dart';

class AppSessionManagerService {
  late final SessionManager _sessionManager;
 SessionManager get sessionManager => _sessionManager;

 set sessionManager(SessionManager value) => _sessionManager = value;
 
  Future init() async {
    sessionManager = SessionManager(
      caller: locator<DemopodServerClientService>().client.modules.auth,
    );

    await _sessionManager.initialize();
  }
}
