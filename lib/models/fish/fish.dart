import 'package:critterpedia/models/critter/availability.dart';
import 'package:critterpedia/models/critter/critter.dart';
import 'package:critterpedia/models/critter/names.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fish.g.dart';

@JsonSerializable()
class Fish extends Critter {
  Fish(
    int id,
    String fileName,
    Names names,
    Availability availability,
    int price,
    String catchPhrase,
    String museumPhrase,
    String imageUri,
    String iconUri,
    this.priceCj,
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

  @override
  factory Fish.fromJson(Map<String, dynamic> json) => _$FishFromJson(json);

  Map<String, dynamic> toJson() => _$FishToJson(this);

  @JsonKey(name: 'price-cj')
  final int priceCj;

  final String shadow;
}
