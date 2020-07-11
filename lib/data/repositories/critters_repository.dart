import 'package:critterpedia/data/data_providers/critters_remote_data_provider.dart';
import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/insect/insect.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';

class CrittersRepository {
  CrittersRepository({this.remoteDataProvider});
  final CrittersRemoteDataProvider remoteDataProvider;

  Future<Insects> getInsects() async {
    return await remoteDataProvider.getInsects();
  }

  Future<Fishes> getFishes() async {
    return await remoteDataProvider.getFishes();
  }

  Future<SeaCreatures> getSeaCreatures() async {
    return await remoteDataProvider.getSeaCreatures();
  }
}
