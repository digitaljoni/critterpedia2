import 'package:critterpedia/generated/l10n.dart';

import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:critterpedia/utils/constants/available_languages.dart';
import 'package:critterpedia/utils/languages/languages.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:critterpedia/utils/extensions/string_extensions.dart';

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
            padding: const EdgeInsets.only(
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
                  icon: const Icon(Icons.clear),
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
          DrawerTitle(S.of(context).showNamesIn),
          Column(
            children: availableLanguages
                .map(
                  (String language) => DrawerTile(
                    onTap: () {
                      filterViewModel.changeLanguage(language);
                    },
                    titleText: Languages.getDisplayLanguage(language).titleCase,
                    trailing: filter.isCurrentLanguage(language)
                        ? Icon(
                            Icons.check,
                            color: Theme.of(context).accentColor,
                          )
                        : null,
                  ),
                )
                .toList(),
          ),
          const AboutApp()
        ],
      ),
    );
  }
}

class AboutApp extends StatelessWidget {
  const AboutApp({
    Key key,
  }) : super(key: key);

  Future<void> _launchProjectPage() async {
    const url = 'https://digitaljoni.com/projects/critterpedia/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchProjectPage();
      },
      child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: Row(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                width: 80.0,
                height: 80.0,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/app_icon.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Critterpedia v.1.0',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Built by digitaljoni.com',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.white60,
                        ),
                  ),
                  Text(
                    'Built using Flutter/Dart',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.white60,
                        ),
                  ),
                  Text(
                    'Data by ACNH Api',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.white60,
                        ),
                  ),
                ],
              ),
            ],
          )),
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
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(
        top: 16.0,
      ),
      decoration: const BoxDecoration(
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
    Key key,
  }) : super(key: key);

  final String titleText;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
