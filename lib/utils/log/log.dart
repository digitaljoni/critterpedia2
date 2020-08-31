import 'package:logging/logging.dart';

class Log {
  static const String _name = 'Log';
  static Logger _instance;

  static void init() {
    Logger.root.onRecord.listen((LogRecord record) {
      // ignore: avoid_print
      print('[${record.level.name}] ${record.time} : ${record.message} ');
    });
    _instance = Logger(_name);
  }

  static void setLevel(Level level) {
    Logger.root.level = level;
  }

  static void info(String message, [Object error, StackTrace stackTrace]) {
    _instance.info(message, error, stackTrace);
  }

  static void warning(String message, [Object error, StackTrace stackTrace]) {
    _instance.warning(message, error, stackTrace);
  }

  static void config(String message, [Object error, StackTrace stackTrace]) {
    _instance.config(message, error, stackTrace);
  }

  static void fine(String message, [Object error, StackTrace stackTrace]) {
    _instance.fine(message, error, stackTrace);
  }

  static void finer(String message, [Object error, StackTrace stackTrace]) {
    _instance.finer(message, error, stackTrace);
  }

  static void finest(String message, [Object error, StackTrace stackTrace]) {
    _instance.finest(message, error, stackTrace);
  }

  static void severe(String message, [Object error, StackTrace stackTrace]) {
    _instance.severe(message, error, stackTrace);
  }

  static void shout(String message, [Object error, StackTrace stackTrace]) {
    _instance.shout(message, error, stackTrace);
  }
}
