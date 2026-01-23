import 'package:flutter_test/flutter_test.dart';
import 'package:acqua_way_web/core/validators/validators.dart';

void main() {
  group('Validators', () {
    group('email', () {
      test('should return null for valid email', () {
        expect(Validators.email('test@example.com'), isNull);
        expect(Validators.email('user.name+tag@example.co.uk'), isNull);
      });

      test('should return error for null or empty email', () {
        expect(Validators.email(null), isNotNull);
        expect(Validators.email(''), isNotNull);
      });

      test('should return error for invalid email format', () {
        expect(Validators.email('invalid'), isNotNull);
        expect(Validators.email('invalid@'), isNotNull);
        expect(Validators.email('@example.com'), isNotNull);
        expect(Validators.email('test@'), isNotNull);
      });
    });

    group('password', () {
      test('should return null for valid password', () {
        expect(Validators.password('Password123'), isNull);
        expect(Validators.password('MyP@ssw0rd'), isNull);
      });

      test('should return error for null or empty password', () {
        expect(Validators.password(null), isNotNull);
        expect(Validators.password(''), isNotNull);
      });

      test('should return error for short password', () {
        expect(Validators.password('Short1'), isNotNull);
      });

      test('should return error for password without uppercase', () {
        expect(Validators.password('password123'), isNotNull);
      });

      test('should return error for password without lowercase', () {
        expect(Validators.password('PASSWORD123'), isNotNull);
      });

      test('should return error for password without number', () {
        expect(Validators.password('Password'), isNotNull);
      });
    });

    group('required', () {
      test('should return null for non-empty value', () {
        expect(Validators.required('test'), isNull);
        expect(Validators.required('  test  '), isNull);
      });

      test('should return error for null or empty value', () {
        expect(Validators.required(null), isNotNull);
        expect(Validators.required(''), isNotNull);
        expect(Validators.required('   '), isNotNull);
      });
    });

    group('phone', () {
      test('should return null for valid phone', () {
        expect(Validators.phone('(11) 98765-4321'), isNull);
        expect(Validators.phone('11987654321'), isNull);
        expect(Validators.phone('11 98765-4321'), isNull);
      });

      test('should return error for invalid phone', () {
        expect(Validators.phone(null), isNotNull);
        expect(Validators.phone('123'), isNotNull);
        expect(Validators.phone('123456789012'), isNotNull);
      });
    });

    group('cpf', () {
      test('should return null for valid CPF', () {
        // Valid CPF: 11144477735
        expect(Validators.cpf('111.444.777-35'), isNull);
        expect(Validators.cpf('11144477735'), isNull);
      });

      test('should return error for invalid CPF', () {
        expect(Validators.cpf(null), isNotNull);
        expect(Validators.cpf('123'), isNotNull);
        expect(Validators.cpf('11111111111'), isNotNull); // All same digits
        expect(Validators.cpf('12345678901'), isNotNull); // Invalid check digits
      });
    });

    group('minLength', () {
      test('should return null for value with sufficient length', () {
        expect(Validators.minLength('test', 3), isNull);
        expect(Validators.minLength('test', 4), isNull);
      });

      test('should return error for value shorter than minimum', () {
        expect(Validators.minLength('te', 3), isNotNull);
        expect(Validators.minLength(null, 3), isNotNull);
      });
    });

    group('maxLength', () {
      test('should return null for value within maximum length', () {
        expect(Validators.maxLength('test', 10), isNull);
        expect(Validators.maxLength('test', 4), isNull);
      });

      test('should return error for value longer than maximum', () {
        expect(Validators.maxLength('test', 3), isNotNull);
      });

      test('should return null for null value', () {
        expect(Validators.maxLength(null, 3), isNull);
      });
    });
  });
}
