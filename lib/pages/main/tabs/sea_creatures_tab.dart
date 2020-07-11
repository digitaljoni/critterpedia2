import 'package:critterpedia/generated/l10n.dart';
import 'package:flutter/material.dart';

class SeaCreaturesTab extends StatelessWidget {
  const SeaCreaturesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(S.of(context).seaCreatures),
      ),
    );
  }
}
