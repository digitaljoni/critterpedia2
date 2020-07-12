import 'package:critterpedia/pages/critter/critter_page_view_model.dart';
import 'package:flutter/material.dart';

class FishPageViewModel extends CritterPageViewModel {
  FishPageViewModel({@required repository}) : super(repository: repository);

  @override
  Future<void> getDetails(String fileName) async {
    critter = await repository.getFish(fileName);
    notifyListeners();
  }
}
