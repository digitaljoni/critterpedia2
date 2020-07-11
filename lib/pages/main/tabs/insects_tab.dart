import 'package:critterpedia/common_widgets/critter_icons_icons.dart';
import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:critterpedia/models/insect/insect.dart';
import 'package:critterpedia/models/insect/insects_view_model.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_tile.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_view.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsectsTab extends StatefulWidget {
  const InsectsTab({Key key}) : super(key: key);

  @override
  _InsectsTabState createState() => _InsectsTabState();
}

class _InsectsTabState extends State<InsectsTab> {
  void _onTapHandler(String id) {
    Log.info('show fish#$id');
  }

  @override
  void initState() {
    super.initState();

    final insectsViewModel =
        Provider.of<InsectsViewModel>(context, listen: false);

    insectsViewModel.getInsects();
  }

  @override
  Widget build(BuildContext context) {
    final insectsViewModel = Provider.of<InsectsViewModel>(context);
    final insects = insectsViewModel.insects;

    if (insects == null) {
      return LoadingWidget();
    }

    List<Widget> _gridTiles = insects.getList
        .map(
          (Insect insect) => CritterGridTile(
            iconUri: insect.iconUri,
            iconData: CritterIcons.insect,
            onTap: () => _onTapHandler('${insect.id}'),
          ),
        )
        .toList();

    return CritterGridView(children: _gridTiles);
  }
}
