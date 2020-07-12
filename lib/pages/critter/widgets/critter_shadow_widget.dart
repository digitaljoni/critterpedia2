import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:flutter/material.dart';

class CritterShadowWidget extends StatelessWidget {
  CritterShadowWidget({this.critter});

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    String shadow;

    if (critter is Fish || critter is SeaCreature) {
      shadow = (critter is Fish)
          ? (critter as Fish).shadow
          : (critter as SeaCreature).shadow;
    }
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
      ),
      child: Row(
        children: <Widget>[
          (critter is Fish || critter is SeaCreature)
              ? Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('Shadow Size'),
                      Card(
                        margin: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(
                            10.0,
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              '$shadow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
