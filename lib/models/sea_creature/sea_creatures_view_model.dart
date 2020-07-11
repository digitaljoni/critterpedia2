import 'package:critterpedia/data/repositories/critters_repository.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:flutter/material.dart';

class SeaCreaturesViewModel extends ChangeNotifier {
  SeaCreaturesViewModel({this.repository});

  CrittersRepository repository;

  SeaCreatures _seaCreatures;

  SeaCreatures get seaCreatures => _seaCreatures;

  Future<void> getSeaCreatures() async {
    _seaCreatures = await repository.getSeaCreatures();
    notifyListeners();
  }
}
