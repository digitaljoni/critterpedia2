import 'package:critterpedia/generated/l10n.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:critterpedia/pages/critter/widgets/section_widget.dart';
import 'package:flutter/material.dart';

class CritterLocationRowWidget extends StatelessWidget {
  const CritterLocationRowWidget(this.critter);

  final Critter critter;

  @override
  Widget build(BuildContext context) {
    String shadow;

    if (critter is Fish || critter is SeaCreature) {
      shadow = (critter is Fish)
          ? (critter as Fish).shadow
          : (critter as SeaCreature).shadow;
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: (critter is SeaCreature)
              ? SectionTextWidget(
                  title: S.of(context).speedTitle,
                  info: (critter as SeaCreature).speed,
                )
              : SectionTextWidget(
                  title: S.of(context).locationTitle,
                  info: critter.location,
                ),
        ),
        if (critter is Fish || critter is SeaCreature)
          Expanded(
            child: SectionTextWidget(
              title: S.of(context).shadowTitle,
              info: shadow,
            ),
          ),
      ],
    );
  }
}
