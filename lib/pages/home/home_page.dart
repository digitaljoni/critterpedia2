import 'package:critterpedia/app/config/styles/colors.dart';
import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/app/app_view_model.dart';
import 'package:critterpedia/pages/home/loading_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  static const routeName = '/';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppViewModel>(context).appState;

    if (!appState.isReady) {
      return LoadingPage();
    }

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppStyle.primaryColor,
            AppStyle.accentColor,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/app_logo.png'),
            RaisedButton(
              child: Text('START'),
              onPressed: () {
                final router =
                    Provider.of<Application>(context, listen: false).router;

                router.navigateTo(
                  context,
                  '/main',
                  replace: true,
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
