import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:critterpedia/models/sea_creature/sea_creatures_view_model.dart';
import 'package:critterpedia/pages/main/widgets/critters_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeaCreaturesTab extends StatefulWidget {
  const SeaCreaturesTab({Key key}) : super(key: key);

  @override
  _SeaCreaturesTabState createState() => _SeaCreaturesTabState();
}

class _SeaCreaturesTabState extends State<SeaCreaturesTab> {
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
      return const LoadingWidget();
    }

    return CrittersWidget(seaCreatures);
  }
}
