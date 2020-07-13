// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog _$CatalogFromJson(Map<String, dynamic> json) {
  return Catalog(
    (json['caught'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'caught': instance.caught,
    };
