import 'package:flutter/material.dart';

class CrittersGridView extends StatelessWidget {
  const CrittersGridView({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      crossAxisCount: 3,
      children: children,
    );
  }
}
