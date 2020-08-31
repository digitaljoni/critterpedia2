import 'package:cached_network_image/cached_network_image.dart';
import 'package:critterpedia/common_widgets/check_circle_widget.dart';
import 'package:critterpedia/models/catalog/catalog_view_model.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CritterHeaderWidget extends StatelessWidget {
  const CritterHeaderWidget(this.critter);

  final Critter critter;
  Widget topImage(BuildContext context) {
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 80.0,
          height: 80.0,
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
            Positioned(
              top: -30.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
            topImage(context),
            iconImage(context),
            CritterCheckButton(
              critter: critter,
            ),
            const Positioned(
              top: 36.0,
              left: 10.0,
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}

class CritterCheckButton extends StatelessWidget {
  const CritterCheckButton({
    @required this.critter,
    Key key,
  }) : super(key: key);

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    final catalogViewModel = Provider.of<CatalogViewModel>(context);

    final catalog = catalogViewModel.catalog;

    final buttonColor = catalog.hasCaught(critter.fileName)
        ? Theme.of(context).accentColor
        : Colors.black26;

    final iconColor =
        catalog.hasCaught(critter.fileName) ? Colors.white : Colors.black26;

    return Positioned(
      bottom: 8.0,
      right: 32.0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: CheckCircleWidget(
          onToggle: () {
            catalogViewModel.toggleCaught(critter.fileName);
            Log.info('add critter');
          },
          buttonColor: buttonColor,
          iconColor: iconColor,
          size: 44.0,
        ),
      ),
    );

    // return Consumer<CatalogViewModel>(
    //       builder: (context, catalogViewModel, ),
    // );
  }
}
