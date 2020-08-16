import 'package:critterpedia/models/critter/availability.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/critter/names.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insect.g.dart';

class Insects extends Critters<Insect> {
  Insects(Map<String, Insect> allMap) : super(allMap);

  factory Insects.fromJson(Map<String, dynamic> json) {
    final allMap = json.map(
      (String k, dynamic v) => MapEntry(
        k,
        Insect.fromJson(v as Map<String, dynamic>),
      ),
    );

    return Insects(allMap);
  }

  Map<String, dynamic> toJson() => allMap.map(
        (String k, Insect v) => MapEntry(
          k,
          v.toJson(),
        ),
      );
}

@JsonSerializable()
class Insect extends Critter {
  Insect(
    int id,
    String fileName,
    Names names,
    Availability availability,
    int price,
    String catchPhrase,
    String museumPhrase,
    String imageUri,
    String iconUri,
    this.priceFlick,
    this.shadow,
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

  factory Insect.fromJson(Map<String, dynamic> json) => _$InsectFromJson(json);

  Map<String, dynamic> toJson() => _$InsectToJson(this);

  @JsonKey(name: 'price-flick')
  final int priceFlick;

  final String shadow;
}
