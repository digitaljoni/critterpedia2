import 'package:critterpedia/data/data_providers/catalog_local_data_provider.dart';
import 'package:critterpedia/models/catalog/catalog.dart';
import 'package:meta/meta.dart';

class CatalogRepository {
  CatalogRepository({
    @required this.localDataProvider,
  });

  final CatalogLocalDataProvider localDataProvider;

  Catalog _catalog;

  Future<Catalog> getCatalog() async {
    if (_catalog != null) {
      return _catalog;
    }

    return _catalog = await localDataProvider.getCatalog();
  }

  Future<void> saveCatalog(Catalog catalog) async {
    _catalog = catalog;

    localDataProvider.saveCatalog(catalog);
  }
}
