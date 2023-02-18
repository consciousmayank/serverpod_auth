import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/demopod_server_client_service.dart';

class LoginViewViewModel extends BaseViewModel {
  late final EmailAuthController _emailAuth;

  LoginViewViewModel(){
    _emailAuth = EmailAuthController(locator<DemopodServerClientService>().client.modules.auth,);
  }

  createAccount() async{
    bool success = await locator<DemopodServerClientService>().client.modules.auth.email.createAccountRequest(
      'naman',
      'naman@joshi.com',
      'Test@121',
    );

    locator<SnackbarService>().showSnackbar(message: success ? 'Show Account validation':'Error');
  }
}
