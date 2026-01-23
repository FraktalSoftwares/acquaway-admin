/// Test helpers and utilities
class TestHelpers {
  /// Create a mock error for testing
  static Exception createMockError([String message = 'Test error']) {
    return Exception(message);
  }

  /// Create a mock stack trace for testing
  static StackTrace createMockStackTrace() {
    return StackTrace.current;
  }
}
