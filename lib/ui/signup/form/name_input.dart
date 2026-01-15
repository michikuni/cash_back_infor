import 'package:formz/formz.dart';

enum NameValidatorError { invalid }

class NameInput extends FormzInput<String, NameValidatorError>{
  const NameInput.pure() : super.pure('');
  const NameInput.dirty([super.value = '']) : super.dirty();
  
  static final _nameRegex = RegExp(r"^[a-zA-Z\s\-']+$");
  @override
  NameValidatorError? validator(String value) {
    return _nameRegex.hasMatch(value) ? null : NameValidatorError.invalid;
  }
}