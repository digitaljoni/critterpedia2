import 'package:critterpedia/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainTab extends StatelessWidget {
  const MainTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(S.of(context).mainTab),
      ),
    );
  }
}
