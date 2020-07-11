import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/fish/fishes_view_model.dart';
import 'package:critterpedia/utils/log/log.dart';
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

    Log.shout('FishTab executed');
  }

  @override
  Widget build(BuildContext context) {
    final fishesViewModel = Provider.of<FishesViewModel>(context);
    final fishes = fishesViewModel.fishes;

    if (fishes == null) {
      return LoadingWidget();
    }

    return GridView.count(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      crossAxisCount: 3,
      children: fishes.getList
          .map(
            (Fish fish) => GridTile(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Image.network(
                    fish.iconUri,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
