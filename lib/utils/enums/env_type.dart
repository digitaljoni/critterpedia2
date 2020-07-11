enum EnvType { DEVELOPMENT, STAGING, PRODUCTION }

extension EnvTypeParser on EnvType {
  String toShortString() {
    final value = this;
    return value.toString().split('.').last;
  }

  static EnvType parseString(String value) {
    return EnvType.values.firstWhere((e) => e.toShortString() == value);
  }
}
