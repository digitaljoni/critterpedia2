// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fish _$FishFromJson(Map<String, dynamic> json) {
  return Fish(
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
    json['image-uri'] as String,
    json['icon-uri'] as String,
    json['price-cj'] as int,
    json['shadow'] as String,
  );
}

Map<String, dynamic> _$FishToJson(Fish instance) => <String, dynamic>{
      'id': instance.id,
      'file-name': instance.fileName,
      'name': instance.names,
      'availability': instance.availability,
      'price': instance.price,
      'catch-phrase': instance.catchPhrase,
      'museum-phrase': instance.museumPhrase,
      'image-uri': instance.imageUri,
      'icon-uri': instance.iconUri,
      'price-cj': instance.priceCj,
      'shadow': instance.shadow,
    };
