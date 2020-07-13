import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:critterpedia/utils/extensions/string_extensions.dart';
import 'package:provider/provider.dart';

class CritterTitleWidget extends StatelessWidget {
  CritterTitleWidget(
    this.critter,
  );

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    final filterViewModel =
        Provider.of<FilterViewModel>(context, listen: false);
    final filter = filterViewModel.filter;

    return Column(
      children: <Widget>[
        Text(
          critter.getName(filter.language).titleCase,
          style: TextStyle(
            fontSize: 24.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        Text(
          critter.rarity,
          style: TextStyle(
            fontSize: 18.0,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
