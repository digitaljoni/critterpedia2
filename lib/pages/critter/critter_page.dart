import 'package:critterpedia/common_widgets/loading_widget.dart';
// import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/pages/critter/critter_page_view_model.dart';
import 'package:critterpedia/pages/critter/widgets/critter_availability_widget.dart';
import 'package:critterpedia/pages/critter/widgets/critter_header_widget.dart';
import 'package:critterpedia/pages/critter/widgets/critter_phrases_widget.dart';
import 'package:critterpedia/pages/critter/widgets/critter_location_row_widget.dart';
import 'package:critterpedia/pages/critter/widgets/critter_price_row_widget.dart';
import 'package:critterpedia/pages/critter/widgets/critter_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CritterPage extends StatelessWidget {
  // CritterPage(this._critter);

  // final Critter _critter;
  @override
  Widget build(BuildContext context) {
    final critterPageViewModel = Provider.of<CritterPageViewModel>(context);

    final _critter = critterPageViewModel.critter;

    if (_critter == null) {
      return Scaffold(
        body: LoadingWidget(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              CritterHeaderWidget(_critter),
              CritterTitleWidget(_critter),
              CritterAvailabilityWidget(_critter),
              CritterLocationRowWidget(_critter),
              CritterPriceRowWidget(_critter),
              CritterPhrasesWidget(
                catchPhrases: _critter.catchPhrase,
                museumPhrases: _critter.museumPhrase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
