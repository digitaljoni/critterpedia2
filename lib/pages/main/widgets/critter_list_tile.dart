import 'package:cached_network_image/cached_network_image.dart';
import 'package:critterpedia/models/catalog/catalog_view_model.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:critterpedia/utils/extensions/string_extensions.dart';

class CritterListTile extends StatelessWidget {
  const CritterListTile({
    @required this.iconData,
    @required this.critter,
    @required this.onTap,
    @required this.onToggle,
    Key key,
  }) : super(key: key);

  final IconData iconData;

  final Critter critter;
  final Function onTap;
  final Function onToggle;

  @override
  Widget build(BuildContext context) {
    return Consumer2<FilterViewModel, CatalogViewModel>(
      builder: (context, filterViewModel, catalogViewModel, _) {
        final filter = filterViewModel.filter;
        final catalog = catalogViewModel.catalog;

        final buttonColor = catalog.hasCaught(critter.fileName)
            ? Theme.of(context).accentColor
            : Colors.black26;

        final month =
            filter.isCurrentMonth ? filterViewModel.currentMonth : null;
        final hour = filter.isCurrentHour ? filterViewModel.currentHour : null;

        final isAvailable = critter.isAvailable(filter.hemisphere, month, hour);

        // final isHidden =
        return GestureDetector(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Container(
                width: 60.0,
                height: 60.0,
                child: Opacity(
                  opacity: isAvailable ? 1.0 : 0.1,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: critter.iconUri,
                      placeholder: (context, _) => Container(
                        child: Icon(
                          iconData, // CritterIcons.fish,
                          size: 36.0,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${critter.name}'.titleCase,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              '${filter.isNorth ? critter.getMonthAvailableNorth : critter.getMonthAvailableSouth}'
                                  .titleCase,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.white38,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: onToggle,
                        icon: Icon(Icons.check, color: buttonColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
