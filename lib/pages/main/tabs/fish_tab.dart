import 'package:critterpedia/common_widgets/critter_icons_icons.dart';
import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/fish/fishes_view_model.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_tile.dart';
import 'package:critterpedia/pages/main/widgets/critter_grid_view.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FishTab extends StatefulWidget {
  const FishTab({Key key}) : super(key: key);

  @override
  _FishTabState createState() => _FishTabState();
}

class _FishTabState extends State<FishTab> {
  void _onTapHandler(String id) {
    Log.info('show fish#$id');
  }

  @override
  void initState() {
    super.initState();

    final fishesViewModel =
        Provider.of<FishesViewModel>(context, listen: false);

    fishesViewModel.getFishes();
  }

  @override
  Widget build(BuildContext context) {
    final fishesViewModel = Provider.of<FishesViewModel>(context);
    final fishes = fishesViewModel.fishes;

    if (fishes == null) {
      return LoadingWidget();
    }

    List<Widget> _gridTiles = fishes.getList
        .map(
          (Fish fish) => CritterGridTile(
            iconUri: fish.iconUri,
            iconData: CritterIcons.fish,
            onTap: () => _onTapHandler('${fish.id}'),
          ),
        )
        .toList();

    return CritterGridView(children: _gridTiles);
  }
}
