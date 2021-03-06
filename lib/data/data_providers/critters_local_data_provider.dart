import 'dart:convert';

import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/insect/insect.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrittersLocalDataProvider {
  CrittersLocalDataProvider(this.prefs);
  final SharedPreferences prefs;

  final keyFishes = 'FISHES';
  final keyInsects = 'INSECTS';
  final keySeaCreatures = 'SEACREATURES';

  Future<Insects> getInsects() async {
    final data = prefs.getString(keyInsects);

    if (data == null || data == '') {
      return null;
    }

    final dynamic jsonData = json.decode(data);
    Log.info('Fetched insects from local data provider');
    final Insects insects = Insects.fromJson(jsonData as Map<String, dynamic>);
    return Future.value(insects);
  }

  Future<Fishes> getFishes() async {
    final data = prefs.getString(keyFishes);

    if (data == null || data == '') {
      return null;
    }

    final dynamic jsonData = json.decode(data);
    Log.info('Fetched fishes from local data provider');
    final Fishes fishes = Fishes.fromJson(jsonData as Map<String, dynamic>);
    return Future.value(fishes);
  }

  Future<SeaCreatures> getSeaCreatures() async {
    final data = prefs.getString(keySeaCreatures);

    if (data == null || data == '') {
      return null;
    }

    final dynamic jsonData = json.decode(data);
    Log.info('Fetched seaCreatures from local data provider');
    final SeaCreatures seaCreatures =
        SeaCreatures.fromJson(jsonData as Map<String, dynamic>);
    return Future.value(seaCreatures);
  }

  void saveFishes(Fishes fishes) {
    final jsonString = json.encode(fishes.toJson());
    prefs.setString(keyFishes, jsonString);
    Log.info('Save fishes to local data provider');
  }

  void saveInsects(Insects insects) {
    final jsonString = json.encode(insects.toJson());
    prefs.setString(keyInsects, jsonString);
    Log.info('Save insects to local data provider');
  }

  void saveSeaCretures(SeaCreatures seaCreatures) {
    final jsonString = json.encode(seaCreatures.toJson());
    prefs.setString(keySeaCreatures, jsonString);
    Log.info('Save seaCreatures to local data provider');
  }
}
