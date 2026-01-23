import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Centralized logging utility for the application
/// 
/// Provides structured logging with different levels (debug, info, warning, error).
/// In debug mode, shows detailed logs. In release mode, only shows warnings and errors.
class AppLogger {
  AppLogger._();

  static Logger? _logger;

  /// Initialize the logger
  static void initialize({bool enableInRelease = false}) {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: kDebugMode ? 2 : 0,
        errorMethodCount: kDebugMode ? 8 : 0,
        lineLength: kDebugMode ? 120 : 0,
        colors: kDebugMode,
        printEmojis: kDebugMode,
        printTime: kDebugMode,
      ),
      level: kDebugMode || enableInRelease ? Level.debug : Level.warning,
    );
  }

  static Logger get _instance {
    _logger ??= Logger(
      printer: PrettyPrinter(
        methodCount: kDebugMode ? 2 : 0,
        errorMethodCount: kDebugMode ? 8 : 0,
        lineLength: kDebugMode ? 120 : 0,
        colors: kDebugMode,
        printEmojis: kDebugMode,
        printTime: kDebugMode,
      ),
      level: kDebugMode ? Level.debug : Level.warning,
    );
    return _logger!;
  }

  /// Log debug messages (only in debug mode)
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _instance.d(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log info messages
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log warning messages
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log error messages
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log fatal errors
  static void f(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log with custom level
  static void log(Level level, dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    _instance.log(level, message, error: error, stackTrace: stackTrace);
  }
}
