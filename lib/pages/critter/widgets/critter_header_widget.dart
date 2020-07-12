import 'package:cached_network_image/cached_network_image.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:flutter/material.dart';

class CritterHeaderWidget extends StatelessWidget {
  CritterHeaderWidget(this.critter);

  final Critter critter;
  Widget topImage(BuildContext context) {
    return Positioned(
      top: -40.0,
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: CachedNetworkImage(
          imageUrl: critter.imageUri,
          // fit: BoxFit.contain,
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
          // height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  Widget iconImage(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(
          10.0,
        ),
        padding: EdgeInsets.all(8.0),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Container(
          width: 30.0,
          height: 30.0,
          child: CachedNetworkImage(
            imageUrl: critter.iconUri,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        child: Stack(
          children: <Widget>[
            topImage(context),
            iconImage(context),
            Positioned(
              top: 36.0,
              left: 10.0,
              child: BackButton(
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
