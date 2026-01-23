import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuration class for environment variables
/// 
/// This class provides access to environment variables loaded from .env file.
/// All sensitive credentials should be accessed through this class.
class EnvConfig {
  EnvConfig._();

  /// Supabase project URL
  static String get supabaseUrl {
    final url = dotenv.env['SUPABASE_URL'];
    if (url == null || url.isEmpty) {
      throw Exception(
          'SUPABASE_URL não encontrada no arquivo .env. Verifique a configuração.');
    }
    return url;
  }

  /// Supabase anonymous key (safe to expose in frontend)
  static String get supabaseAnonKey {
    final key = dotenv.env['SUPABASE_ANON_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception(
          'SUPABASE_ANON_KEY não encontrada no arquivo .env. Verifique a configuração.');
    }
    return key;
  }

  /// Optional: Supabase service key (NEVER expose in frontend, backend only)
  static String? get supabaseServiceKey => dotenv.env['SUPABASE_SERVICE_KEY'];

  /// Environment (development, staging, production)
  static String get environment =>
      dotenv.env['ENVIRONMENT'] ?? 'development';

  /// Debug mode
  static bool get debugMode {
    final debug = dotenv.env['DEBUG'];
    return debug?.toLowerCase() == 'true';
  }

  /// Check if running in production
  static bool get isProduction => environment == 'production';

  /// Check if running in development
  static bool get isDevelopment => environment == 'development';
}
