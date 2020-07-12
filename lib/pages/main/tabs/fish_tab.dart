import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:critterpedia/models/fish/fishes_view_model.dart';
import 'package:critterpedia/pages/main/widgets/critters_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FishTab extends StatefulWidget {
  const FishTab({Key key}) : super(key: key);

  @override
  _FishTabState createState() => _FishTabState();
}

class _FishTabState extends State<FishTab> {
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

    return CrittersWidget(fishes);
  }
}
