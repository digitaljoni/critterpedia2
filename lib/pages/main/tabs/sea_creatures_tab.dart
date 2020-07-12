import 'package:critterpedia/common_widgets/critter_icons_icons.dart';
import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:critterpedia/models/sea_creature/sea_creatures_view_model.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_tile.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_view.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeaCreaturesTab extends StatefulWidget {
  const SeaCreaturesTab({Key key}) : super(key: key);

  @override
  _SeaCreaturesTabState createState() => _SeaCreaturesTabState();
}

class _SeaCreaturesTabState extends State<SeaCreaturesTab> {
  void _onTapHandler(String id) {
    Log.info('show fish#$id');
  }

  @override
  void initState() {
    super.initState();

    final seaCreaturesViewModel =
        Provider.of<SeaCreaturesViewModel>(context, listen: false);

    seaCreaturesViewModel.getSeaCreatures();
  }

  @override
  Widget build(BuildContext context) {
    final seaCreaturesViewModel = Provider.of<SeaCreaturesViewModel>(context);
    final seaCreatures = seaCreaturesViewModel.seaCreatures;

    if (seaCreatures == null) {
      return LoadingWidget();
    }

    List<Widget> _gridTiles = seaCreatures.getList
        .map(
          (SeaCreature seaCreature) => CritterGridTile(
            critter: seaCreature,
            iconData: CritterIcons.sea,
            onTap: () => _onTapHandler('${seaCreature.id}'),
          ),
        )
        .toList();

    return CritterGridView(children: _gridTiles);
  }
}
