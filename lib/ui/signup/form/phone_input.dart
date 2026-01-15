import 'package:formz/formz.dart';

enum PhoneValidationError { invalid }

class PhoneInput extends FormzInput<String, PhoneValidationError> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([super.value = '']) : super.dirty();

  static final _regExp = RegExp(r'^[0-9]{10,11}$');

  @override
  PhoneValidationError? validator(String value) {
    return _regExp.hasMatch(value) ? null : PhoneValidationError.invalid;
  }
}
