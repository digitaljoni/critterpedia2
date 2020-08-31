import 'package:flutter/material.dart';

class CrittersListView extends StatelessWidget {
  const CrittersListView({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      children: children,
    );
  }
}
