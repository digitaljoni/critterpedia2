import 'package:critterpedia/utils/enums/hemisphere.dart';
import 'package:json_annotation/json_annotation.dart';

part 'availability.g.dart';

@JsonSerializable()
class Availability {
  Availability(
    this.northernMonths,
    this.southernMonths,
    this.time,
    this.isAllDay,
    this.isAllYear,
    this.location,
    this.rarity,
    this.northernMonthList,
    this.southernMonthList,
    this.timeList,
  );

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);

  @JsonKey(name: 'month-northern')
  final String northernMonths;

  @JsonKey(name: 'month-southern')
  final String southernMonths;

  final String time;

  final bool isAllDay;
  final bool isAllYear;

  final String location;
  final String rarity;

  @JsonKey(name: 'month-array-northern')
  final List<int> northernMonthList;

  @JsonKey(name: 'month-array-southern')
  final List<int> southernMonthList;

  @JsonKey(name: 'time-array')
  final List<int> timeList;

  bool isAvailable(
    Hemisphere hemisphere,
    int month,
    int hour,
  ) {
    final monthList =
        hemisphere == Hemisphere.north ? northernMonthList : southernMonthList;

    return month != null
        ? monthList.contains(month)
        : true && hour != null ? timeList.contains(hour) : true;
  }
}
