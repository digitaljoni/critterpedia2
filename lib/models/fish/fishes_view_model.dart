import 'package:critterpedia/data/repositories/critters_repository.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:flutter/material.dart';

class FishesViewModel extends ChangeNotifier {
  FishesViewModel({this.repository});

  CrittersRepository repository;

  Fishes _fishes;

  Fishes get fishes => _fishes;

  Future<void> getFishes() async {
    _fishes = await repository.getFishes();
    notifyListeners();
  }
}
