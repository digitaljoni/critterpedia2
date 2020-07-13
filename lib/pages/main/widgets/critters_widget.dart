import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/common_widgets/critter_icons_icons.dart';
import 'package:critterpedia/models/catalog/catalog_view_model.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_tile.dart';
import 'package:critterpedia/pages/main/widgets/critter_list_tile.dart';
import 'package:critterpedia/pages/main/widgets/critters_list_view.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'critters_grid_view.dart';

class CrittersWidget extends StatelessWidget {
  const CrittersWidget(this.critters, {Key key}) : super(key: key);

  final Critters critters;

  void _onToggleHandler(BuildContext context, String fileName) {
    final catalogViewModel =
        Provider.of<CatalogViewModel>(context, listen: false);

    catalogViewModel.toggleCaught(fileName);

    Log.info('longPress: $fileName');
  }

  void _onTapHandler(BuildContext context, String routePath) {
    final application = Provider.of<Application>(context, listen: false);
    final router = application.router;

    Log.info('navigateTo: $routePath');
    router.navigateTo(context, '$routePath');
  }

  @override
  Widget build(BuildContext context) {
    final filterViewModel = Provider.of<FilterViewModel>(context);

    IconData iconData;
    String routePath;

    if (critters is Fishes) {
      iconData = CritterIcons.fish;
      routePath = '/fish/';
    } else if (critters is SeaCreatures) {
      iconData = CritterIcons.sea;
      routePath = '/sea/';
    } else {
      iconData = CritterIcons.insect;
      routePath = '/insect/';
    }

    final critterList = critters.getList.map(
      (Critter critter) {
        final critterRoute = '$routePath${critter.fileName}';

        return (filterViewModel.isGridView)
            ? CritterGridTile(
                critter: critter,
                iconData: iconData,
                onTap: () => _onTapHandler(context, critterRoute),
                onToggle: () => _onToggleHandler(context, critter.fileName),
              )
            : CritterListTile(
                critter: critter,
                iconData: iconData,
                onTap: () => _onTapHandler(context, critterRoute),
                onToggle: () => _onToggleHandler(context, critter.fileName),
              );
      },
    ).toList();

    return filterViewModel.isGridView
        ? CrittersGridView(children: critterList)
        : CrittersListView(children: critterList);
  }
}
