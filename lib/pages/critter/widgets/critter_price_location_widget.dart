import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:flutter/material.dart';

class CritterPriceLocationWidget extends StatelessWidget {
  CritterPriceLocationWidget({this.critter});

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: (critter is SeaCreature)
              ? Column(
                  children: <Widget>[
                    Text('Speed'),
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
                            '${(critter as SeaCreature).speed}',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Text('Location'),
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
                            '${critter.location}',
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
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text('Price'),
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
                      '${critter.price} Bells',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
