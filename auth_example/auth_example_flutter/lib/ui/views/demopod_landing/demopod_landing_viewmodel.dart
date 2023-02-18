import 'package:auth_example_client/auth_example_client.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/demopod_server_client_service.dart';
import '../../common/app_strings.dart';

class DemopodLandingViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final DemopodServerClientService _clientService =
      locator<DemopodServerClientService>();

  List<Article> _allArticles = [];
  List<Article> get allArticles => _allArticles;

  set allArticles(List<Article> value) => _allArticles = value;

  void addNewArticle() async {
    bool result = await runBusyFuture(
        _clientService.addArticle(
          newArticle: Article(
            title: 'new Article',
            content: 'New Content',
            publishedOn: DateTime.now(),
            isPrime: false,
          ),
        ),
        busyObject: addNewArticleBusyObject);

    _snackbarService.showSnackbar(
        message: result ? 'Article Added!' : 'Article not added');
    // fetchAllArticles();
  }

  void fetchAllArticles() async {
    allArticles = await runBusyFuture(_clientService.fetchAllArticles(),
        busyObject: fetchAllArticlesBusyObject);
  }
}
