import 'package:critterpedia/data/data_providers/critters_local_data_provider.dart';
import 'package:critterpedia/data/data_providers/critters_remote_data_provider.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/insect/insect.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';

import 'package:meta/meta.dart';

class CrittersRepository {
  CrittersRepository({
    @required this.remoteDataProvider,
    @required this.localDataProvider,
  });
  final CrittersRemoteDataProvider remoteDataProvider;
  final CrittersLocalDataProvider localDataProvider;

  Insects _insects;
  Fishes _fishes;
  SeaCreatures _seaCreatures;

  Future<Insects> getInsects() async {
    if (_insects != null) {
      return _insects;
    }

    _insects = await localDataProvider.getInsects();

    if (_insects != null) {
      return _insects;
    }

    _insects = await remoteDataProvider.getInsects();

    if (_insects != null) {
      // save to local
      localDataProvider.saveInsects(_insects);
    }

    return _insects;
  }

  Future<Fishes> getFishes() async {
    if (_fishes != null) {
      return _fishes;
    }

    _fishes = await localDataProvider.getFishes();

    if (_fishes != null) {
      return _fishes;
    }
    _fishes = await remoteDataProvider.getFishes();

    if (_fishes != null) {
      // save to local
      localDataProvider.saveFishes(_fishes);
    }

    return _fishes;
  }

  Future<SeaCreatures> getSeaCreatures() async {
    if (_seaCreatures != null) {
      return _seaCreatures;
    }

    _seaCreatures = await localDataProvider.getSeaCreatures();

    if (_seaCreatures != null) {
      return _seaCreatures;
    }
    _seaCreatures = await remoteDataProvider.getSeaCreatures();

    if (_seaCreatures != null) {
      // save to local
      localDataProvider.saveSeaCretures(_seaCreatures);
    }

    return _seaCreatures;
  }
}
