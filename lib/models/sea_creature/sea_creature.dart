import 'package:critterpedia/models/critter/availability.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/critter/names.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sea_creature.g.dart';

class SeaCreatures extends Critters<SeaCreature> {
  SeaCreatures(Map<String, SeaCreature> allMap) : super(allMap);

  factory SeaCreatures.fromJson(Map<String, dynamic> json) {
    final allMap = json.map(
      (String k, dynamic v) => MapEntry(
        k,
        SeaCreature.fromJson(v),
      ),
    );

    return SeaCreatures(allMap);
  }

  Map<String, dynamic> toJson() => allMap.map(
        (String k, SeaCreature v) => MapEntry(
          k,
          v.toJson(),
        ),
      );
}

@JsonSerializable()
class SeaCreature extends Critter {
  SeaCreature(
    int id,
    String fileName,
    Names names,
    Availability availability,
    int price,
    String catchPhrase,
    String museumPhrase,
    String imageUri,
    String iconUri,
    this.shadow,
    this.speed,
  ) : super(
          id,
          fileName,
          names,
          availability,
          price,
          catchPhrase,
          museumPhrase,
          imageUri,
          iconUri,
        );

  factory SeaCreature.fromJson(Map<String, dynamic> json) =>
      _$SeaCreatureFromJson(json);

  Map<String, dynamic> toJson() => _$SeaCreatureToJson(this);

  final String shadow;

  final String speed;
}
