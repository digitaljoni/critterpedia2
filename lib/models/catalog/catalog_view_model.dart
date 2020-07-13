import 'dart:async';

import 'package:critterpedia/data/repositories/catalog_repository.dart';
import 'package:critterpedia/models/catalog/catalog.dart';
import 'package:flutter/material.dart';

class CatalogViewModel extends ChangeNotifier {
  CatalogViewModel({this.repository});

  final CatalogRepository repository;

  Catalog _catalog;

  Catalog get catalog => _catalog;

  Future<void> getCatalog() async {
    if (_catalog != null) {
      return _catalog;
    }
    _catalog = await repository.getCatalog();

    _catalog = _catalog ?? Catalog.empty();
  }

  void toggleCaught(String fileName) {
    _catalog = _catalog.addRemoveCatch(fileName);
    repository.saveCatalog(catalog);
    notifyListeners();
  }
}
