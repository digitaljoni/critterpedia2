import 'package:critterpedia/app/app_view_model.dart';
import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/common_widgets/critter_icons_icons.dart';
import 'package:critterpedia/generated/l10n.dart';
import 'package:critterpedia/pages/main/loading_page.dart';
import 'package:critterpedia/pages/main/tabs/fish_tab.dart';
import 'package:critterpedia/pages/main/tabs/insects_tab.dart';
import 'package:critterpedia/pages/main/tabs/sea_creatures_tab.dart';
import 'package:critterpedia/pages/main/widgets/main_drawer.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  static const routeName = '/';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage();
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int tabIndex;

  List<Widget> tabs = [
    InsectsTab(),
    FishTab(),
    SeaCreaturesTab(),
  ];

  @override
  void initState() {
    super.initState();
    tabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppViewModel>(context).appState;

    if (!appState.isReady) {
      return LoadingPage();
    }

    final application = Provider.of<Application>(context, listen: false);
    final router = application.router;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {
              router.navigateTo(
                context,
                '/settings',
              );
            },
          ),
        ],
      ),
      drawer: MainDrawer(router: router),
      body: tabs[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        onTap: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CritterIcons.insect),
            title: Text(S.of(context).insects),
          ),
          BottomNavigationBarItem(
            icon: Icon(CritterIcons.fish),
            title: Text(S.of(context).fish),
          ),
          BottomNavigationBarItem(
            icon: Icon(CritterIcons.sea),
            title: Text(S.of(context).seaCreatures),
          ),
        ],
      ),
    );
  }
}
