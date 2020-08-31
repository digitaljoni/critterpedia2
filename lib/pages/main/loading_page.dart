import 'package:critterpedia/common_widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
