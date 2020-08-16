import 'dart:convert';

import 'package:critterpedia/models/catalog/catalog.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatalogLocalDataProvider {
  CatalogLocalDataProvider(this.prefs);
  final SharedPreferences prefs;

  final keyCatalog = 'CATALOG';

  Future<Catalog> getCatalog() async {
    final data = prefs.getString(keyCatalog);

    if (data == null || data == '') {
      return null;
    }

    final dynamic jsonData = json.decode(data);
    Log.info('Fetched catalog from local data provider');
    return Catalog.fromJson(jsonData as Map<String, dynamic>);
  }

  void saveCatalog(Catalog catalog) {
    final jsonString = json.encode(catalog.toJson());
    prefs.setString(keyCatalog, jsonString);
    Log.info('Save catalog to local data provider');
  }
}
