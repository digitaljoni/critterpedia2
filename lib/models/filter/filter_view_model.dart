import 'dart:async';

import 'package:critterpedia/models/filter/filter.dart';
import 'package:critterpedia/utils/enums/hemisphere.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  FilterViewModel() {
    setDefault();
    _startTimer();
  }
  Filter _filter = Filter.empty();
  Timer _timer;

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

  void _startTimer() {
    _stopTimer();
    _timer =
        Timer.periodic(Duration(seconds: 30), (timer) => updateCurrentHour());
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void updateCurrentHour() {
    final newHour = DateTime.now().hour;

    Log.info('checking: newHour = $newHour | currentHour = $currentHour');
    if (_currentHour == newHour) {
      return;
    }

    _currentHour = newHour;
    Log.info('change: newHour = $newHour | currentHour = $currentHour');
    notifyListeners();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}
