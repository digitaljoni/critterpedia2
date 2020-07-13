import 'package:critterpedia/utils/enums/hemisphere.dart';

class Filter {
  Filter(
    this.hemisphere,
    this.isCurrentMonth,
    this.isCurrentHour,
    this.month,
    this.hour,
    this.language,
  );

  Filter.empty()
      : hemisphere = null,
        isCurrentMonth = null,
        isCurrentHour = null,
        month = null,
        hour = null,
        language = null;

  final Hemisphere hemisphere;
  final bool isCurrentMonth;
  final bool isCurrentHour;

  final int month;
  final int hour;
  final String language;

  Filter copyWith({
    Hemisphere hemisphere,
    bool isCurrentMonth,
    bool isCurrentHour,
    int month,
    int hour,
    String language,
  }) {
    return Filter(
      hemisphere ?? this.hemisphere,
      isCurrentMonth ?? this.isCurrentMonth,
      isCurrentHour ?? this.isCurrentHour,
      month ?? this.month,
      hour ?? this.hour,
      language ?? this.language,
    );
  }

  bool get isNorth => hemisphere == Hemisphere.north;
  bool get isSouth => hemisphere == Hemisphere.south;
  bool isCurrentLanguage(String _language) => _language == language;
}
