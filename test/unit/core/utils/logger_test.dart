import 'package:flutter_test/flutter_test.dart';
import 'package:acqua_way_web/core/utils/logger.dart';

void main() {
  group('AppLogger', () {
    test('should initialize logger', () {
      AppLogger.initialize();
      // If no exception is thrown, initialization succeeded
      expect(true, isTrue);
    });

    test('should have instance after initialization', () {
      AppLogger.initialize();
      // Logger methods should not throw
      expect(() => AppLogger.d('Debug message'), returnsNormally);
      expect(() => AppLogger.i('Info message'), returnsNormally);
      expect(() => AppLogger.w('Warning message'), returnsNormally);
      expect(() => AppLogger.e('Error message'), returnsNormally);
    });

    test('should handle null messages gracefully', () {
      AppLogger.initialize();
      expect(() => AppLogger.d(null), returnsNormally);
      expect(() => AppLogger.i(null), returnsNormally);
      expect(() => AppLogger.w(null), returnsNormally);
      expect(() => AppLogger.e(null), returnsNormally);
    });
  });
}
