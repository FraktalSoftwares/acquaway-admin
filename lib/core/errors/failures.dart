/// Base class for all failures in the application
/// 
/// Failures represent expected error conditions that can be handled gracefully.
/// They differ from exceptions in that they are part of the normal flow of the application.
abstract class Failure {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  const Failure({
    required this.message,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

/// Failure representing server-side errors (5xx, 4xx)
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    required super.message,
    this.statusCode,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() => statusCode != null
      ? 'ServerFailure ($statusCode): $message'
      : 'ServerFailure: $message';
}

/// Failure representing network connectivity issues
class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() => 'NetworkFailure: $message';
}

/// Failure representing validation errors
class ValidationFailure extends Failure {
  final Map<String, List<String>>? fieldErrors;

  const ValidationFailure({
    required super.message,
    this.fieldErrors,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() => 'ValidationFailure: $message';
}

/// Failure representing authentication/authorization errors
class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() => 'AuthFailure: $message';
}

/// Failure representing data not found errors
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required super.message,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() => 'NotFoundFailure: $message';
}

/// Failure representing permission/access denied errors
class PermissionFailure extends Failure {
  const PermissionFailure({
    required super.message,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() => 'PermissionFailure: $message';
}

/// Failure representing unknown/unexpected errors
class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.originalError,
    super.stackTrace,
  });

  @override
  String toString() => 'UnknownFailure: $message';
}
