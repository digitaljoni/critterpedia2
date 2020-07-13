import 'package:critterpedia/data/repositories/critters_repository.dart';
import 'package:critterpedia/models/insect/insect.dart';
import 'package:flutter/material.dart';

class InsectsViewModel extends ChangeNotifier {
  InsectsViewModel({this.repository});

  final CrittersRepository repository;

  Insects _insects;

  Insects get insects => _insects;

  Future<void> getInsects() async {
    _insects = await repository.getInsects();
    notifyListeners();
  }
}
