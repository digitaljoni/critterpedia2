import 'package:critterpedia/models/critter/availability.dart';
import 'package:critterpedia/models/critter/names.dart';
import 'package:critterpedia/utils/constants/month_names.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Critter {
  Critter(
    this.id,
    this.fileName,
    this.names,
    this.availability,
    this.price,
    this.catchPhrase,
    this.museumPhrase,
    this.imageUri,
    this.iconUri,
  );

  factory Critter.fromJson(Map<String, dynamic> json) => null;

  final int id;

  @JsonKey(name: 'file-name')
  final String fileName;

  @JsonKey(name: 'name')
  final Names names;

  final Availability availability;

  final int price;

  @JsonKey(name: 'catch-phrase')
  final String catchPhrase;

  @JsonKey(name: 'museum-phrase')
  final String museumPhrase;

  @JsonKey(name: 'image-uri')
  final String imageUri;

  @JsonKey(name: 'icon-uri')
  final String iconUri;

  String get name => names?.en;
  String get rarity => availability?.rarity;
  String get timeAvailable => availability?.time;
  String get northernMonths => availability?.northernMonths ?? '';
  String get southernMonths => availability?.southernMonths ?? '';
  String get location => availability?.location ?? 'Unknown';

  bool get isAllDay => availability?.isAllDay ?? false;
  bool get isAllYear => availability?.isAllYear ?? false;

  String get getTimeAvailable => (isAllDay) ? 'All day' : timeAvailable;
  String get getMonthAvailableNorth =>
      (isAllYear) ? 'All year' : monthNumberToName(northernMonths);
  String get getMonthAvailableSouth =>
      (isAllYear) ? 'All year' : monthNumberToName(southernMonths);

  String monthNumberToName(String monthRange) {
    final monthRangeList = monthRange.replaceAll(' ', '').split('&');

    return monthRangeList.map((String months) {
      return months.split('-').map((String month) {
        return monthNames[month];
      }).join('-');
    }).join(' & ');
  }
}
