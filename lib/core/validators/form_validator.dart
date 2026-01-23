import 'validators.dart';

/// Form validator that combines multiple validators
class FormValidator {
  /// Validate a field with multiple validators
  /// Returns the first error found, or null if all validators pass
  static String? validateField(
    String? value,
    List<String? Function(String?)> validators,
  ) {
    for (final validator in validators) {
      final error = validator(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }

  /// Validate email field
  static String? validateEmail(String? value) {
    return Validators.email(value);
  }

  /// Validate password field
  static String? validatePassword(String? value) {
    return Validators.password(value);
  }

  /// Validate password confirmation
  static String? validatePasswordConfirmation(String? value, String? password) {
    return Validators.passwordConfirmation(value, password);
  }

  /// Validate required field
  static String? validateRequired(String? value, [String fieldName = 'Campo']) {
    return Validators.required(value, fieldName);
  }

  /// Validate phone field
  static String? validatePhone(String? value) {
    return Validators.phone(value);
  }

  /// Validate CPF field
  static String? validateCpf(String? value) {
    return Validators.cpf(value);
  }

  /// Validate CNPJ field
  static String? validateCnpj(String? value) {
    return Validators.cnpj(value);
  }

  /// Validate a map of form fields
  /// Returns a map of field names to error messages
  static Map<String, String> validateForm(
    Map<String, String?> fields,
    Map<String, List<String? Function(String?)>> validators,
  ) {
    final errors = <String, String>{};

    for (final entry in fields.entries) {
      final fieldName = entry.key;
      final value = entry.value;

      if (validators.containsKey(fieldName)) {
        final fieldValidators = validators[fieldName]!;
        final error = validateField(value, fieldValidators);
        if (error != null) {
          errors[fieldName] = error;
        }
      }
    }

    return errors;
  }

  /// Check if form is valid
  static bool isFormValid(Map<String, String> errors) {
    return errors.isEmpty;
  }
}
