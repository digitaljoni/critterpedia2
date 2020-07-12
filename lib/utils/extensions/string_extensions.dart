// ignore_for_file:unnecessary_this
extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get titleCaps =>
      this.split(' ').map((String s) => s.inCaps).toList().join(' ');
}
