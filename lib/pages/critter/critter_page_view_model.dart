import 'package:critterpedia/data/repositories/critters_repository.dart';
import 'package:critterpedia/models/critter/critter.dart';
// import 'package:critterpedia/models/fish/fish.dart';
import 'package:flutter/material.dart';

class CritterPageViewModel extends ChangeNotifier {
  CritterPageViewModel({@required this.repository});

  final CrittersRepository repository;

  Critter critter;

  Future<void> getDetails(String fileName) async {
    notifyListeners();
  }
}
