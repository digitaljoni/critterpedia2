import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CritterAvailabilityWidget extends StatelessWidget {
  CritterAvailabilityWidget(
    this.critter,
  );

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    final filterViewModel =
        Provider.of<FilterViewModel>(context, listen: false);

    final filter = filterViewModel.filter;

    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Availability (${filter.isNorth ? 'North' : 'South'}) ',
          ),
          Card(
            margin: EdgeInsets.only(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Container(
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   padding: EdgeInsets.only(
                  //     bottom: 10.0,
                  //   ),
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     border: Border(
                  //       bottom: BorderSide(
                  //         color: Colors.black26,
                  //       ),
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       'Availability (${filter.isNorth ? 'North' : 'South'}) ',
                  //       style: TextStyle(fontSize: 20.0),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Months',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Time',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        filter.isNorth
                            ? Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    '${critter.getMonthAvailableNorth}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    '${critter.getMonthAvailableSouth}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text('${critter.getTimeAvailable}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
