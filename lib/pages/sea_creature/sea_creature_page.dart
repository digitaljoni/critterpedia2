import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/pages/critter/critter_page.dart';
import 'package:critterpedia/pages/critter/critter_page_view_model.dart';

import 'package:critterpedia/pages/sea_creature/sea_creature_view_model.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeaCreaturePage extends StatelessWidget {
  SeaCreaturePage({this.fileName, Key key}) : super(key: key);

  static const routeName = '/sea/:fileName';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SeaCreaturePage(fileName: params['fileName'][0]);
  });

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final application = Provider.of<Application>(context);
    final seaCreaturePageViewModel = SeaCreaturePageViewModel(
      repository: application.crittersRepository,
    );

    seaCreaturePageViewModel.getDetails(fileName);

    return ChangeNotifierProvider<CritterPageViewModel>.value(
      value: seaCreaturePageViewModel,
      child: CritterPage(),
    );
  }
}
