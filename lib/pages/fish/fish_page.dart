import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/pages/critter/critter_page.dart';
import 'package:critterpedia/pages/critter/critter_page_view_model.dart';
import 'package:critterpedia/pages/fish/fish_page_view_model.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FishPage extends StatelessWidget {
  FishPage({this.fileName, Key key}) : super(key: key);

  static const routeName = '/fish/:fileName';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FishPage(fileName: params['fileName'][0]);
  });

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final application = Provider.of<Application>(context);
    final fishPageViewModel = FishPageViewModel(
      repository: application.crittersRepository,
    );

    fishPageViewModel.getDetails(fileName);

    return ChangeNotifierProvider<CritterPageViewModel>.value(
      value: fishPageViewModel,
      child: CritterPage(),
    );
  }
}
