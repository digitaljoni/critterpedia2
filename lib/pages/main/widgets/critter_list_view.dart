import 'package:flutter/material.dart';

class CritterListView extends StatelessWidget {
  const CritterListView({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      children: children,
    );
  }
}
