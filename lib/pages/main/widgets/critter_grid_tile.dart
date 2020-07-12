import 'package:cached_network_image/cached_network_image.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CritterGridTile extends StatelessWidget {
  const CritterGridTile({
    @required this.iconData,
    @required this.onTap,
    @required this.critter,
    Key key,
  }) : super(key: key);

  final IconData iconData;
  final Function onTap;
  final Critter critter;

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterViewModel>(
      builder: (context, filterViewModel, _) {
        final filter = filterViewModel.filter;

        final month =
            filter.isCurrentMonth ? filterViewModel.currentMonth : null;
        final hour = filter.isCurrentHour ? filterViewModel.currentHour : null;

        final isAvailable = critter.isAvailable(filter.hemisphere, month, hour);

        // final isHidden =
        return GridTile(
          child: GestureDetector(
            onTap: onTap,
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
