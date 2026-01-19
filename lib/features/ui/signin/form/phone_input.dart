import 'package:formz/formz.dart';


enum PhoneValidationError { invalid, short }
class PhoneInput extends FormzInput<String, PhoneValidationError>{
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([super.value = '']) : super.dirty();
  static final phoneRex = RegExp(r'^(?:(\+84|84|0){1})(3|5|7|8|9)([0-9]{8})$');
  @override
  PhoneValidationError? validator(String value) {
    if(value.length < 6 || value.length > 15){
      return PhoneValidationError.short;
    }
    if(!phoneRex.hasMatch(value)){
      return PhoneValidationError.invalid;
    }
    return null;
  }
}