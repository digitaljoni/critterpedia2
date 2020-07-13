import 'package:json_annotation/json_annotation.dart';

part 'names.g.dart';

@JsonSerializable()
class Names {
  Names(
    this.en,
    this.de,
    this.es,
    this.fr,
    this.it,
    this.nl,
    this.zh,
    this.ja,
    this.ko,
    this.ru,
  );

  factory Names.fromJson(Map<String, dynamic> json) => _$NamesFromJson(json);

  Map<String, dynamic> toJson() => _$NamesToJson(this);

  @JsonKey(name: 'name-USen')
  final String en;

  @JsonKey(name: 'name-EUde')
  final String de;

  @JsonKey(name: 'name-EUes')
  final String es;

  @JsonKey(name: 'name-EUfr')
  final String fr;

  @JsonKey(name: 'name-EUit')
  final String it;

  @JsonKey(name: 'name-EUnl')
  final String nl;

  @JsonKey(name: 'name-CNzh')
  final String zh;

  @JsonKey(name: 'name-JPja')
  final String ja;

  @JsonKey(name: 'name-KRko')
  final String ko;

  @JsonKey(name: 'name-EUru')
  final String ru;

  String getName(String language) {
    final nameMap = <String, String>{
      'en': en,
      'de': de,
      'es': es,
      'fr': fr,
      'it': it,
      'nl': nl,
      'zh': zh,
      'ja': ja,
      'ko': ko,
      'ru': ru,
    };

    return nameMap[language];
  }
}
