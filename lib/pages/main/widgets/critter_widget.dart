import 'package:critterpedia/common_widgets/critter_icons_icons.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_tile.dart';
import 'package:critterpedia/pages/main/widgets/critter_list_tile.dart';
import 'package:critterpedia/pages/main/widgets/critter_list_view.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'critter_grid_view.dart';

class CritterWidget extends StatelessWidget {
  const CritterWidget(this.critters, {Key key}) : super(key: key);

  final Critters critters;

  void _onTapHandler(BuildContext context, String routePath) {
    Log.info('navigateTo: $routePath');
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
        final critterRoute = '$routePath${critter.id}';

        return (filterViewModel.isGridView)
            ? CritterGridTile(
                critter: critter,
                iconData: iconData,
                onTap: () => _onTapHandler(context, critterRoute),
              )
            : CritterListTile(
                critter: critter,
                iconData: iconData,
                onTap: () => _onTapHandler(context, critterRoute),
              );
      },
    ).toList();

    return filterViewModel.isGridView
        ? CritterGridView(children: critterList)
        : CritterListView(children: critterList);
  }
}
