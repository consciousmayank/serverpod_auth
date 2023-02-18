import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';
import 'demopod_landing_viewmodel.dart';

class DemopodLandingView extends StackedView<DemopodLandingViewModel> {
  const DemopodLandingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DemopodLandingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serverpod Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.addNewArticle();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: viewModel.busy(fetchAllArticlesBusyObject)
            ? const Center(
                child: Text('Fetching articles please wait...'),
              )
            : viewModel.allArticles.isEmpty
                ? const Center(
                    child: Text('No Articles as of now. Please add some.'),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        viewModel.allArticles.elementAt(index).title,
                      ),
                      subtitle: Text(
                        viewModel.allArticles.elementAt(index).content,
                      ),
                    ),
                    itemCount: viewModel.allArticles.length,
                  ),
      ),
    );
  }

  @override
  void onViewModelReady(DemopodLandingViewModel viewModel) {
    viewModel.fetchAllArticles();
  }

  @override
  DemopodLandingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DemopodLandingViewModel();
}
