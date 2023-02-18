import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../enums/dialog_type.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<dynamic, DialogBuilder> builders = {
    // DialogType.infoAlert: (context, sheetRequest, completer) =>
    // InfoAlertDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
