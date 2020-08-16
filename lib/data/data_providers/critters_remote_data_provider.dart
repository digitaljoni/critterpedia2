import 'dart:convert';

import 'package:critterpedia/models/fish/fish.dart';
import 'package:critterpedia/models/insect/insect.dart';
import 'package:critterpedia/models/sea_creature/sea_creature.dart';
import 'package:critterpedia/services/http_service.dart';

class CrittersRemoteDataProvider {
  CrittersRemoteDataProvider(this.clientService);

  final HttpClientService clientService;

  final fishPath = 'fish/';
  final insectPath = 'bugs/';
  final seaCreaturesPath = 'sea/';

  Future<Insects> getInsects() async {
    final data = await clientService.getData(insectPath);

    if (data == null || data == '') {
      return null;
    }

    final dynamic jsonData = json.decode(data);
    return Insects.fromJson(jsonData as Map<String, dynamic>);
  }

  Future<Fishes> getFishes() async {
    final data = await clientService.getData(fishPath);

    if (data == null || data == '') {
      return null;
    }

    final dynamic jsonData = json.decode(data);
    return Fishes.fromJson(jsonData as Map<String, dynamic>);
  }

  Future<SeaCreatures> getSeaCreatures() async {
    final data = await clientService.getData(seaCreaturesPath);

    if (data == null || data == '') {
      return null;
    }

    final dynamic jsonData = json.decode(data);
    return SeaCreatures.fromJson(jsonData as Map<String, dynamic>);
  }
}
