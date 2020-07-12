// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Availability _$AvailabilityFromJson(Map<String, dynamic> json) {
  return Availability(
    json['month-northern'] as String,
    json['month-southern'] as String,
    json['time'] as String,
    json['isAllDay'] as bool,
    json['isAllYear'] as bool,
    json['location'] as String,
    json['rarity'] as String,
    (json['month-array-northern'] as List)?.map((e) => e as int)?.toList(),
    (json['month-array-southern'] as List)?.map((e) => e as int)?.toList(),
    (json['time-array'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'month-northern': instance.northernMonths,
      'month-southern': instance.southernMonths,
      'time': instance.time,
      'isAllDay': instance.isAllDay,
      'isAllYear': instance.isAllYear,
      'location': instance.location,
      'rarity': instance.rarity,
      'month-array-northern': instance.northernMonthList,
      'month-array-southern': instance.southernMonthList,
      'time-array': instance.timeList,
    };
