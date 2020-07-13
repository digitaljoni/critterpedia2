import 'package:json_annotation/json_annotation.dart';

part 'catalog.g.dart';

@JsonSerializable()
class Catalog {
  Catalog(
    this.caught,
  );

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogToJson(this);

  Catalog.empty() : caught = [];

  final List<String> caught;

  bool hasCaught(String fileName) => caught.contains(fileName);

  Catalog copyWith({List<String> caught}) {
    return Catalog(
      caught ?? this.caught,
    );
  }

  Catalog addRemoveCatch(String fileName) {
    final newCaught = <String>[];

    newCaught.addAll(caught);

    if (newCaught.contains(fileName)) {
      newCaught.remove(fileName);
    } else {
      newCaught.add(fileName);
    }

    return copyWith(
      caught: newCaught,
    );
  }
}
