import 'package:critterpedia/generated/l10n.dart';

import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
    @required this.router,
  }) : super(key: key);

  final Router router;

  @override
  Widget build(BuildContext context) {
    final filterViewModel = Provider.of<FilterViewModel>(context);

    final filter = filterViewModel.filter;

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 16.0,
              top: 8.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    S.of(context).settings,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          DrawerTitle(S.of(context).hemisphere),
          DrawerTile(
            onTap: !filter.isNorth
                ? () {
                    filterViewModel.setNorthHemisphere();
                  }
                : null,
            titleText: S.of(context).north,
            trailing: filter.isNorth
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).accentColor,
                  )
                : null,
          ),
          DrawerTile(
            onTap: !filter.isSouth
                ? () {
                    filterViewModel.setSouthHemisphere();
                  }
                : null,
            titleText: S.of(context).south,
            trailing: filter.isSouth
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).accentColor,
                  )
                : null,
          ),
          DrawerTitle(S.of(context).dateTime),
          DrawerTile(
            onTap: () {
              filterViewModel.toggleCurrentMonth();
            },
            titleText: S.of(context).currentMonth,
            trailing: filter.isCurrentMonth
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).accentColor,
                  )
                : null,
          ),
          DrawerTile(
            onTap: () {
              filterViewModel.toggleCurrentHour();
            },
            titleText: S.of(context).currentHour,
            trailing: filter.isCurrentHour
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).accentColor,
                  )
                : null,
          ),
          DrawerTitle(S.of(context).settingsLanguage),
          Column(
            children: <Widget>[
              DrawerTile(
                titleText: 'English',
                trailing: Icon(
                  Icons.check,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          // ListTile(
          //   title: Text(S.of(context).profile),
          //   onTap: () {
          //     Navigator.pop(context);
          //     router.navigateTo(context, '/profile/4567');
          //   },
          // ),
          // ListTile(
          //   title: Text(S.of(context).settings),
          //   onTap: () {
          //     Navigator.pop(context);
          //     router.navigateTo(context, '/settings');
          //   },
          // ),
        ],
      ),
    );
  }
}

class DrawerTitle extends StatelessWidget {
  const DrawerTitle(
    this.titleText, {
    Key key,
  }) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(
        top: 16.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white24,
          ),
        ),
      ),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    this.titleText,
    this.trailing,
    this.onTap,
    key,
  }) : super(key: key);

  final String titleText;
  final Widget trailing;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border(
          bottom: BorderSide(
            color: Colors.white24,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(titleText),
        trailing: trailing,
      ),
    );
  }
}
