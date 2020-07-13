import 'package:critterpedia/generated/l10n.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/insect/insect.dart';
import 'package:critterpedia/pages/critter/widgets/section_widget.dart';
import 'package:flutter/material.dart';

class CritterPriceRowWidget extends StatelessWidget {
  CritterPriceRowWidget(this.critter);

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SectionTextWidget(
            title: S.of(context).priceTitle(
                  S.of(context).shop,
                ),
            info: S.of(context).priceInBells('${critter.price}'),
          ),
        ),
        (critter is Fish)
            ? Expanded(
                child: SectionTextWidget(
                  title: S.of(context).priceTitle('CJ'),
                  info: S
                      .of(context)
                      .priceInBells('${(critter as Fish).priceCj}'),
                ),
              )
            : SizedBox(),
        (critter is Insect)
            ? Expanded(
                child: SectionTextWidget(
                  title: S.of(context).priceTitle(
                        'Flick',
                      ),
                  info: S
                      .of(context)
                      .priceInBells('${(critter as Insect).priceFlick}'),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
