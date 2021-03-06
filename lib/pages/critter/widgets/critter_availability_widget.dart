import 'package:critterpedia/generated/l10n.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:critterpedia/pages/critter/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CritterAvailabilityWidget extends StatelessWidget {
  const CritterAvailabilityWidget(
    this.critter,
  );

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    final filterViewModel =
        Provider.of<FilterViewModel>(context, listen: false);

    final filter = filterViewModel.filter;

    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: SectionWidget(
        title: 'Availability (${filter.isNorth ? 'North' : 'South'}) ',
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      S.of(context).availabilityMonthsTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      S.of(context).availabilityHoursTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  if (filter.isNorth)
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          critter.getMonthAvailableNorth,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  else
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          critter.getMonthAvailableSouth,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(critter.getTimeAvailable),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
