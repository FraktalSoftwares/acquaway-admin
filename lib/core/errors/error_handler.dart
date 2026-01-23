import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/core/errors/failures.dart';
import '/core/utils/logger.dart';

/// Centralized error handler for the application
///
/// Provides methods to convert exceptions and errors into user-friendly messages
/// and appropriate Failure objects.
class ErrorHandler {
  ErrorHandler._();

  /// Convert an exception/error to a Failure
  static Failure handleError(
    dynamic error, [
    StackTrace? stackTrace,
  ]) {
    AppLogger.e('Error occurred', error, stackTrace);

    if (error is Failure) {
      return error;
    }

    if (error is AuthException) {
      return AuthFailure(
        message: _getAuthErrorMessage(error),
        originalError: error,
        stackTrace: stackTrace,
      );
    }

    if (error is PostgrestException) {
      return ServerFailure(
        message: _getPostgrestErrorMessage(error),
        statusCode: error.code != null ? int.tryParse(error.code!) : null,
        originalError: error,
        stackTrace: stackTrace,
      );
    }

    if (error is StorageException) {
      return ServerFailure(
        message: _getStorageErrorMessage(error),
        originalError: error,
        stackTrace: stackTrace,
      );
    }

    // Handle Functions errors (check by error message/type)
    if (error.toString().contains('FunctionsException') ||
        error.toString().contains('functions')) {
      return ServerFailure(
        message: _getFunctionsErrorMessage(error),
        originalError: error,
        stackTrace: stackTrace,
      );
    }

    // Handle Realtime errors (check by error message/type)
    if (error.toString().contains('RealtimeException') ||
        error.toString().contains('realtime')) {
      return ServerFailure(
        message: 'Erro de conexão em tempo real. Tente recarregar a página.',
        originalError: error,
        stackTrace: stackTrace,
      );
    }

    // Handle network errors
    if (error.toString().contains('SocketException') ||
        error.toString().contains('Network') ||
        error.toString().contains('connection')) {
      return NetworkFailure(
        message: 'Erro de conexão. Verifique sua internet e tente novamente.',
        originalError: error,
        stackTrace: stackTrace,
      );
    }

    // Handle timeout errors
    if (error.toString().contains('Timeout') ||
        error.toString().contains('timeout')) {
      return NetworkFailure(
        message: 'Tempo de conexão esgotado. Tente novamente.',
        originalError: error,
        stackTrace: stackTrace,
      );
    }

    // Default to unknown failure
    return UnknownFailure(
      message: 'Ocorreu um erro inesperado. Tente novamente mais tarde.',
      originalError: error,
      stackTrace: stackTrace,
    );
  }

  /// Get user-friendly error message from a Failure
  static String getErrorMessage(Failure failure) {
    return failure.message;
  }

  /// Show error message to user via SnackBar
  static void showError(
    BuildContext context,
    Failure failure, {
    Duration duration = const Duration(seconds: 4),
  }) {
    final message = getErrorMessage(failure);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor: Colors.red,
      ),
    );
  }

  /// Show error message from exception/error
  static void showErrorFromException(
    BuildContext context,
    dynamic error, [
    StackTrace? stackTrace,
  ]) {
    final failure = handleError(error, stackTrace);
    showError(context, failure);
  }

  /// Get user-friendly message for AuthException
  static String _getAuthErrorMessage(AuthException error) {
    final message = error.message.toLowerCase();

    if (message.contains('invalid') || message.contains('incorrect')) {
      return 'Credenciais inválidas. Verifique seu e-mail e senha.';
    }

    if (message.contains('email') && message.contains('already')) {
      return 'Este e-mail já está cadastrado.';
    }

    if (message.contains('email') && message.contains('not confirmed')) {
      return 'E-mail não confirmado. Verifique sua caixa de entrada.';
    }

    if (message.contains('password')) {
      return 'Senha inválida. Verifique e tente novamente.';
    }

    if (message.contains('token') || message.contains('expired')) {
      return 'Sessão expirada. Faça login novamente.';
    }

    if (message.contains('user not found')) {
      return 'Usuário não encontrado.';
    }

    return 'Erro de autenticação. Tente novamente.';
  }

  /// Get user-friendly message for PostgrestException
  static String _getPostgrestErrorMessage(PostgrestException error) {
    final code = error.code;
    final message = error.message.toLowerCase();

    if (code == '23505') {
      return 'Este registro já existe.';
    }

    if (code == '23503') {
      return 'Não é possível excluir este registro pois está em uso.';
    }

    if (code == '23502') {
      return 'Campos obrigatórios não preenchidos.';
    }

    if (code == 'PGRST116') {
      return 'Nenhum registro encontrado.';
    }

    if (message.contains('permission') || message.contains('denied')) {
      return 'Você não tem permissão para realizar esta ação.';
    }

    if (message.contains('not found')) {
      return 'Registro não encontrado.';
    }

    return 'Erro ao processar solicitação. Tente novamente.';
  }

  /// Get user-friendly message for StorageException
  static String _getStorageErrorMessage(StorageException error) {
    final message = error.message.toLowerCase();

    if (message.contains('not found')) {
      return 'Arquivo não encontrado.';
    }

    if (message.contains('permission') || message.contains('denied')) {
      return 'Você não tem permissão para acessar este arquivo.';
    }

    if (message.contains('size') || message.contains('too large')) {
      return 'Arquivo muito grande. Tente um arquivo menor.';
    }

    return 'Erro ao processar arquivo. Tente novamente.';
  }

  /// Get user-friendly message for Functions errors
  static String _getFunctionsErrorMessage(dynamic error) {
    // Try to extract status code from error if available
    final errorString = error.toString().toLowerCase();

    if (errorString.contains('404') || errorString.contains('not found')) {
      return 'Serviço não encontrado.';
    }

    if (errorString.contains('500') ||
        errorString.contains('internal server')) {
      return 'Erro interno do servidor. Tente novamente mais tarde.';
    }

    if (errorString.contains('401') ||
        errorString.contains('403') ||
        errorString.contains('unauthorized') ||
        errorString.contains('forbidden')) {
      return 'Você não tem permissão para realizar esta ação.';
    }

    return 'Erro ao processar solicitação. Tente novamente.';
  }
}
