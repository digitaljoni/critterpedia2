import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/pages/critter/critter_page.dart';
import 'package:critterpedia/pages/critter/critter_page_view_model.dart';
import 'package:critterpedia/pages/insect/insect_page_view_model.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsectPage extends StatelessWidget {
  InsectPage({this.fileName, Key key}) : super(key: key);

  static const routeName = '/insect/:fileName';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return InsectPage(fileName: params['fileName'][0]);
  });

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final application = Provider.of<Application>(context);
    final insectPageViewModel = InsectPageViewModel(
      repository: application.crittersRepository,
    );

    insectPageViewModel.getDetails(fileName);

    return ChangeNotifierProvider<CritterPageViewModel>.value(
      value: insectPageViewModel,
      child: CritterPage(),
    );
  }
}
