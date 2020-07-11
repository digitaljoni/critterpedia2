import 'package:critterpedia/generated/l10n.dart';
import 'package:flutter/material.dart';

class LocationTab extends StatelessWidget {
  const LocationTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(S.of(context).locationTab),
      ),
    );
  }
}
