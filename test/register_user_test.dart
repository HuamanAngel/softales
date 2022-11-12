import 'package:flutter_test/flutter_test.dart';
import '../lib/presentation/login/register_page.dart';

void main() {
  test('form field username test null', () {
    var result = UsernameFieldValidator.validate(null);
    expect(result, null);
  });
  test('form field username test empty', () {
    var result = UsernameFieldValidator.validate('');
    expect(result, 'Debe contener solo letras');
  });
  test('form field username test only numbers', () {
    var result = UsernameFieldValidator.validate('5798');
    expect(result, 'Debe contener solo letras');
  });
  test('form field username test less than 5 characters', () {
    var result = UsernameFieldValidator.validate('Albr');
    expect(result, 'Debe ser mayor a 5 caracteres');
  });
  test('form field username test greater than 30 characters', () {
    var result =
        UsernameFieldValidator.validate('Juan Jose Enrique Henrry Gonzalo');
    expect(result, 'Debe ser menor a 30 caracteres');
  });
  test('form field username test correct', () {
    var result = UsernameFieldValidator.validate('Juan Hurtado');
    expect(result, null);
  });
  test('form field email test empty', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'El valor ingresado no es un correo');
  });
  test('form field email test incorrect', () {
    var result = EmailFieldValidator.validate('dfsghsdgss@f');
    expect(result, 'El valor ingresado no es un correo');
  });
  test('form field email test correct', () {
    var result = EmailFieldValidator.validate('blabla@gmail.com');
    expect(result, null);
  });
  test('form field password test incorrect', () {
    var result = PasswordFieldValidator.validate('gssf');
    expect(result, 'La clave debe ser al menos 5 caracteres');
  });
  test('form field password test correct', () {
    var result = PasswordFieldValidator.validate('Fgss@f56');
    expect(result, null);
  });
}
