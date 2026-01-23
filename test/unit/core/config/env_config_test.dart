import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:acqua_way_web/core/config/env_config.dart';

void main() {
  group('EnvConfig', () {
    setUp(() async {
      // Load test environment variables
      await dotenv.load(fileName: '.env.test', mergeWith: {
        'SUPABASE_URL': 'https://test.supabase.co',
        'SUPABASE_ANON_KEY': 'test_anon_key',
        'ENVIRONMENT': 'test',
        'DEBUG': 'true',
      });
    });

    tearDown(() {
      // Clean up after each test
      dotenv.clean();
    });

    test('should get supabaseUrl from environment', () {
      expect(EnvConfig.supabaseUrl, isNotEmpty);
      expect(EnvConfig.supabaseUrl, contains('supabase.co'));
    });

    test('should get supabaseAnonKey from environment', () {
      expect(EnvConfig.supabaseAnonKey, isNotEmpty);
    });

    test('should get environment from environment variable', () {
      expect(EnvConfig.environment, isNotEmpty);
    });

    test('should get debugMode from environment variable', () {
      expect(EnvConfig.debugMode, isA<bool>());
    });

    test('should identify production environment', () {
      dotenv.env['ENVIRONMENT'] = 'production';
      expect(EnvConfig.isProduction, isTrue);
      expect(EnvConfig.isDevelopment, isFalse);
    });

    test('should identify development environment', () {
      dotenv.env['ENVIRONMENT'] = 'development';
      expect(EnvConfig.isDevelopment, isTrue);
      expect(EnvConfig.isProduction, isFalse);
    });

    test('should throw exception when SUPABASE_URL is missing', () {
      dotenv.clean();
      expect(() => EnvConfig.supabaseUrl, throwsException);
    });

    test('should throw exception when SUPABASE_ANON_KEY is missing', () {
      dotenv.clean();
      expect(() => EnvConfig.supabaseAnonKey, throwsException);
    });
  });
}
