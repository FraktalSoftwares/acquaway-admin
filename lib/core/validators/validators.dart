/// Reusable validators for common input types
class Validators {
  Validators._();

  /// Validates email format
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail é obrigatório';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'E-mail inválido';
    }

    return null;
  }

  /// Validates password strength
  /// Requires at least 8 characters, one uppercase, one lowercase, and one number
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (value.length < 8) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Senha deve conter pelo menos uma letra maiúscula';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Senha deve conter pelo menos uma letra minúscula';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Senha deve conter pelo menos um número';
    }

    return null;
  }

  /// Validates password confirmation
  static String? passwordConfirmation(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirmação de senha é obrigatória';
    }

    if (value != password) {
      return 'As senhas não coincidem';
    }

    return null;
  }

  /// Validates required field
  static String? required(String? value, [String fieldName = 'Campo']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório';
    }
    return null;
  }

  /// Validates minimum length
  static String? minLength(String? value, int min, [String fieldName = 'Campo']) {
    if (value == null || value.length < min) {
      return '$fieldName deve ter pelo menos $min caracteres';
    }
    return null;
  }

  /// Validates maximum length
  static String? maxLength(String? value, int max, [String fieldName = 'Campo']) {
    if (value != null && value.length > max) {
      return '$fieldName deve ter no máximo $max caracteres';
    }
    return null;
  }

  /// Validates phone number (Brazilian format)
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefone é obrigatório';
    }

    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    // Brazilian phone: 10 or 11 digits (with or without area code)
    if (digitsOnly.length < 10 || digitsOnly.length > 11) {
      return 'Telefone inválido';
    }

    return null;
  }

  /// Validates CPF (Brazilian tax ID)
  static String? cpf(String? value) {
    if (value == null || value.isEmpty) {
      return 'CPF é obrigatório';
    }

    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length != 11) {
      return 'CPF deve ter 11 dígitos';
    }

    // Check if all digits are the same (invalid CPF)
    if (RegExp(r'^(\d)\1{10}$').hasMatch(digitsOnly)) {
      return 'CPF inválido';
    }

    // Validate CPF check digits
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(digitsOnly[i]) * (10 - i);
    }
    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;
    if (firstDigit != int.parse(digitsOnly[9])) {
      return 'CPF inválido';
    }

    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(digitsOnly[i]) * (11 - i);
    }
    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;
    if (secondDigit != int.parse(digitsOnly[10])) {
      return 'CPF inválido';
    }

    return null;
  }

  /// Validates CNPJ (Brazilian company tax ID)
  static String? cnpj(String? value) {
    if (value == null || value.isEmpty) {
      return 'CNPJ é obrigatório';
    }

    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length != 14) {
      return 'CNPJ deve ter 14 dígitos';
    }

    // Check if all digits are the same (invalid CNPJ)
    if (RegExp(r'^(\d)\1{13}$').hasMatch(digitsOnly)) {
      return 'CNPJ inválido';
    }

    // Validate CNPJ check digits
    final weights1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    int sum = 0;
    for (int i = 0; i < 12; i++) {
      sum += int.parse(digitsOnly[i]) * weights1[i];
    }
    int firstDigit = sum % 11;
    firstDigit = firstDigit < 2 ? 0 : 11 - firstDigit;
    if (firstDigit != int.parse(digitsOnly[12])) {
      return 'CNPJ inválido';
    }

    final weights2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    sum = 0;
    for (int i = 0; i < 13; i++) {
      sum += int.parse(digitsOnly[i]) * weights2[i];
    }
    int secondDigit = sum % 11;
    secondDigit = secondDigit < 2 ? 0 : 11 - secondDigit;
    if (secondDigit != int.parse(digitsOnly[13])) {
      return 'CNPJ inválido';
    }

    return null;
  }

  /// Validates URL format
  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL é obrigatória';
    }

    try {
      final uri = Uri.parse(value);
      if (!uri.hasScheme || (!uri.scheme.startsWith('http'))) {
        return 'URL inválida';
      }
    } catch (e) {
      return 'URL inválida';
    }

    return null;
  }

  /// Validates numeric value
  static String? numeric(String? value, [String fieldName = 'Campo']) {
    if (value == null || value.isEmpty) {
      return '$fieldName é obrigatório';
    }

    if (double.tryParse(value) == null) {
      return '$fieldName deve ser um número';
    }

    return null;
  }

  /// Validates positive number
  static String? positiveNumber(String? value, [String fieldName = 'Campo']) {
    final numericError = numeric(value, fieldName);
    if (numericError != null) return numericError;

    if (double.parse(value!) <= 0) {
      return '$fieldName deve ser maior que zero';
    }

    return null;
  }

  /// Validates date is not in the future
  static String? notFuture(DateTime? value, [String fieldName = 'Data']) {
    if (value == null) {
      return '$fieldName é obrigatória';
    }

    if (value.isAfter(DateTime.now())) {
      return '$fieldName não pode ser no futuro';
    }

    return null;
  }

  /// Validates date is not in the past
  static String? notPast(DateTime? value, [String fieldName = 'Data']) {
    if (value == null) {
      return '$fieldName é obrigatória';
    }

    if (value.isBefore(DateTime.now())) {
      return '$fieldName não pode ser no passado';
    }

    return null;
  }
}
