import 'package:critterpedia/pages/critter/widgets/section_widget.dart';
import 'package:flutter/material.dart';

class CritterPhrasesWidget extends StatelessWidget {
  CritterPhrasesWidget({
    @required this.catchPhrases,
    @required this.museumPhrases,
  });

  final String catchPhrases;
  final String museumPhrases;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16.0,
          ),
          child: Text(
            '" $catchPhrases "',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white38,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SectionWidget(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              museumPhrases,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      ],
    );
  }
}
