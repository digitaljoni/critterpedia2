import 'package:flutter/material.dart';
import 'package:critterpedia/utils/extensions/string_extensions.dart';

class CritterTitleWidget extends StatelessWidget {
  CritterTitleWidget({
    @required this.title,
    @required this.rarity,
  });

  final String title;
  final String rarity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title.titleCase,
          style: TextStyle(
            fontSize: 24.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        Text(
          rarity,
          style: TextStyle(
            fontSize: 18.0,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
