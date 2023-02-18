import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/demopod_server_client_service.dart';
import '../../common/ui_helpers.dart';
import 'login_view_viewmodel.dart';

class LoginViewView extends StackedView<LoginViewViewModel> {
  const LoginViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInWithEmailButton(
              caller: locator<DemopodServerClientService>().client.modules.auth,
              onSignedIn: () {
                locator<NavigationService>()
                    .replaceWith(Routes.demopodLandingView);
              },
              onFailure: () {
                locator<SnackbarService>()
                    .showSnackbar(message: 'Sign In Failed!');
              },
            ),
            verticalSpaceSmall,
            TextButton(
              onPressed: () {
                viewModel.createAccount();
              },
              child: const Text(
                'Create Account',
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  LoginViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewViewModel();
}
