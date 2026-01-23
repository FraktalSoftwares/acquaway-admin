/// Base class for custom exceptions in the application
abstract class AppException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  const AppException({
    required this.message,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

/// Exception for configuration errors
class ConfigurationException extends AppException {
  const ConfigurationException({
    required super.message,
    super.originalError,
    super.stackTrace,
  });
}

/// Exception for data parsing errors
class DataParsingException extends AppException {
  const DataParsingException({
    required super.message,
    super.originalError,
    super.stackTrace,
  });
}

/// Exception for invalid state errors
class InvalidStateException extends AppException {
  const InvalidStateException({
    required super.message,
    super.originalError,
    super.stackTrace,
  });
}
