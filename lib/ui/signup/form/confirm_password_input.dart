import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { invalid }

class ConfirmPasswordInput extends FormzInput<String, ConfirmPasswordValidationError>{
  final String password;
  const ConfirmPasswordInput.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordInput.dirty({required this.password, String value = ''}) : super.dirty(value);
  static final passwordRegExp = RegExp(r'^.{6,}$');
  @override
  ConfirmPasswordValidationError? validator(String value) {
    return (value == password && passwordRegExp.hasMatch(value)) ? null : ConfirmPasswordValidationError.invalid;
  }
}