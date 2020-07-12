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
          margin: EdgeInsets.all(
            16.0,
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
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Text(
            museumPhrases,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        )
      ],
    );
  }
}
