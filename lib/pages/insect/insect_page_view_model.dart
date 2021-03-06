import 'package:critterpedia/data/repositories/critters_repository.dart';
import 'package:critterpedia/pages/critter/critter_page_view_model.dart';
import 'package:flutter/material.dart';

class InsectPageViewModel extends CritterPageViewModel {
  InsectPageViewModel({@required CrittersRepository repository})
      : super(repository: repository);

  @override
  Future<void> getDetails(String fileName) async {
    critter = await repository.getInsect(fileName);
    notifyListeners();
  }
}
