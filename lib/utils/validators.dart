class EmailValidator {
  static const String _pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  static final RegExp _regExp = RegExp(_pattern);
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese un correo';
    }
    if (!_regExp.hasMatch(value)) {
      return 'El valor ingresado no es un correo';
    }
    return null;
  }
}

class PasswordValidator {
  static const String _rule = """La contraseña debe poseer:
  - Entre 8 y 32 caracteres
  - Al menos una letra mayúscula
  - Al menos una letra minúscula
  - Al menos un dígito
  - Al menos un caracter especial: #\$_.""";
  static const String _pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$_\.]).{8,32}$';
  static final RegExp _regExp = RegExp(_pattern);
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese una contraseña';
    }
    if (!_regExp.hasMatch(value)) {
      return _rule;
    }
    return null;
  }
}
