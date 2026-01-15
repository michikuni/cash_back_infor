import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class PasswordInput extends FormzInput<String, PasswordValidationError>{
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();
  static final passwordRegExp = RegExp(r'^.{6,}$');
  @override
  PasswordValidationError? validator(String value) {
    if(value.isEmpty){
      return PasswordValidationError.invalid;
    } 
    return passwordRegExp.hasMatch(value) ? null : PasswordValidationError.invalid;
  }
}