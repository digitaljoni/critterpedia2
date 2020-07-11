// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'names.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Names _$NamesFromJson(Map<String, dynamic> json) {
  return Names(
    json['name-USen'] as String,
    json['name-EUde'] as String,
    json['name-EUes'] as String,
    json['name-EUfr'] as String,
    json['name-EUit'] as String,
    json['name-EUnl'] as String,
    json['name-CNzh'] as String,
    json['name-JPja'] as String,
    json['name-KRko'] as String,
    json['name-EUru'] as String,
  );
}

Map<String, dynamic> _$NamesToJson(Names instance) => <String, dynamic>{
      'name-USen': instance.en,
      'name-EUde': instance.de,
      'name-EUes': instance.es,
      'name-EUfr': instance.fr,
      'name-EUit': instance.it,
      'name-EUnl': instance.nl,
      'name-CNzh': instance.zh,
      'name-JPja': instance.jp,
      'name-KRko': instance.ko,
      'name-EUru': instance.ru,
    };
