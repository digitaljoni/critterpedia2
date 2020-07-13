import 'package:cached_network_image/cached_network_image.dart';
import 'package:critterpedia/models/catalog/catalog_view_model.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CritterGridTile extends StatelessWidget {
  const CritterGridTile({
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

        final month =
            filter.isCurrentMonth ? filterViewModel.currentMonth : null;
        final hour = filter.isCurrentHour ? filterViewModel.currentHour : null;

        final isAvailable = critter.isAvailable(filter.hemisphere, month, hour);

        final buttonColor = catalog.hasCaught(critter.fileName)
            ? Theme.of(context).accentColor
            : Theme.of(context).cardColor;
        // final isHidden =
        return GridTile(
          child: GestureDetector(
            onTap: onTap,
            onLongPress: onToggle,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
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
          ),
        );
      },
    );
  }
}
