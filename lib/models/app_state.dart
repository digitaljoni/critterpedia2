class AppState {
  AppState(
    this.isDarkMode,
    this.currentLocale,
  );

  AppState.empty()
      : isDarkMode = null,
        currentLocale = null;

  final bool isDarkMode;
  final String currentLocale;

  AppState copyWith({
    bool isDarkMode,
    String currentLocale,
  }) {
    return AppState(
      isDarkMode ?? this.isDarkMode,
      currentLocale ?? this.currentLocale,
    );
  }

  bool get isReady => _isReady();

  bool _isReady() {
    return isDarkMode != null && currentLocale != null;
  }

  @override
  String toString() =>
      'AppState isDarkMode: $isDarkMode, currenLocale: $currentLocale';
}
