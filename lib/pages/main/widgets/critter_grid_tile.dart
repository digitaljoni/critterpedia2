import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CritterGridTile extends StatelessWidget {
  const CritterGridTile({
    @required this.iconUri,
    @required this.iconData,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final String iconUri;
  final IconData iconData;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
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
          child: Center(
            child: CachedNetworkImage(
              imageUrl: iconUri,
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
    );
  }
}
