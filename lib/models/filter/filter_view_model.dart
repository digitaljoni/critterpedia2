import 'package:critterpedia/models/filter/filter.dart';
import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  FilterViewModel() {
    setDefault();
  }
  Filter _filter = Filter.empty();

  int _currentMonth;
  int _currentHour;

  Filter get filter => _filter;
  int get currentMonth => _currentMonth;
  int get currentHour => _currentHour;

  void setDefault() {
    final today = DateTime.now();
    _currentMonth = today.month;
    _currentHour = today.hour;

    _filter = _filter.copyWith(
      hemisphere: Hemisphere.north,
      isCurrentMonth: true,
      isCurrentHour: true,
    );

    notifyListeners();
  }

  void setNorthHemisphere() {
    _filter = _filter.copyWith(hemisphere: Hemisphere.north);
    notifyListeners();
  }

  void setSouthHemisphere() {
    _filter = _filter.copyWith(hemisphere: Hemisphere.south);
    notifyListeners();
  }

  void toggleCurrentMonth() {
    _filter = _filter.copyWith(isCurrentMonth: !_filter.isCurrentMonth);
    notifyListeners();
  }

  void toggleCurrentHour() {
    _filter = _filter.copyWith(isCurrentHour: !_filter.isCurrentHour);
    notifyListeners();
  }

  void settMonth(int month) {
    _filter = _filter.copyWith(month: month);
    notifyListeners();
  }

  void settHour(int hour) {
    _filter = _filter.copyWith(month: hour);
    notifyListeners();
  }
}
