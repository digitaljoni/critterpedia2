// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sea_creature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeaCreature _$SeaCreatureFromJson(Map<String, dynamic> json) {
  return SeaCreature(
    json['id'] as int,
    json['file-name'] as String,
    json['name'] == null
        ? null
        : Names.fromJson(json['name'] as Map<String, dynamic>),
    json['availability'] == null
        ? null
        : Availability.fromJson(json['availability'] as Map<String, dynamic>),
    json['price'] as int,
    json['catch-phrase'] as String,
    json['museum-phrase'] as String,
    json['image_uri'] as String,
    json['icon_uri'] as String,
    json['shadow'] as String,
    json['speed'] as String,
  );
}

Map<String, dynamic> _$SeaCreatureToJson(SeaCreature instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file-name': instance.fileName,
      'name': instance.names,
      'availability': instance.availability,
      'price': instance.price,
      'catch-phrase': instance.catchPhrase,
      'museum-phrase': instance.museumPhrase,
      'image_uri': instance.imageUri,
      'icon_uri': instance.iconUri,
      'shadow': instance.shadow,
      'speed': instance.speed,
    };
