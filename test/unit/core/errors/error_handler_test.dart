import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:acqua_way_web/core/errors/error_handler.dart';
import 'package:acqua_way_web/core/errors/failures.dart';

void main() {
  group('ErrorHandler', () {
    test('should convert AuthException to AuthFailure', () {
      const error = AuthException('Invalid credentials');
      final failure = ErrorHandler.handleError(error);

      expect(failure, isA<AuthFailure>());
      expect(failure.message, contains('Credenciais inválidas'));
    });

    test('should convert PostgrestException to ServerFailure', () {
      const error = PostgrestException(
        'Not found',
        code: 'PGRST116',
        details: '',
        hint: '',
      );
      final failure = ErrorHandler.handleError(error);

      expect(failure, isA<ServerFailure>());
      expect(failure.message, contains('Nenhum registro encontrado'));
    });

    test('should convert network error to NetworkFailure', () {
      final error = Exception('SocketException: Failed host lookup');
      final failure = ErrorHandler.handleError(error);

      expect(failure, isA<NetworkFailure>());
      expect(failure.message, contains('conexão'));
    });

    test('should convert unknown error to UnknownFailure', () {
      final error = Exception('Unknown error');
      final failure = ErrorHandler.handleError(error);

      expect(failure, isA<UnknownFailure>());
      expect(failure.message, contains('erro inesperado'));
    });

    test('should return same Failure if error is already a Failure', () {
      const originalFailure = NetworkFailure(message: 'Test error');
      final result = ErrorHandler.handleError(originalFailure);

      expect(result, equals(originalFailure));
    });
  });
}
