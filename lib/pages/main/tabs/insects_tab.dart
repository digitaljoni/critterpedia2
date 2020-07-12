import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:critterpedia/models/insect/insects_view_model.dart';
import 'package:critterpedia/pages/main/widgets/critters_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsectsTab extends StatefulWidget {
  const InsectsTab({Key key}) : super(key: key);

  @override
  _InsectsTabState createState() => _InsectsTabState();
}

class _InsectsTabState extends State<InsectsTab> {
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

    return CrittersWidget(insects);
  }
}
