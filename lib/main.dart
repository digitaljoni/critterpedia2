import 'package:critterpedia/app/flavor.dart';
import 'package:critterpedia/utils/enums/env_type.dart';

void main() => Development();

class Development extends Flavor {
  @override
  EnvType envType = EnvType.DEVELOPMENT;

  @override
  String baseUrl = 'https://acnhapi.com/v1/';
}
