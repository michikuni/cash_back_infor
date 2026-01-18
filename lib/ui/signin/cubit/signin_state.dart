import '../form/phone_input.dart';

class SigninState{
  final PhoneInput phone;
  final String password;
  final bool isValid;

  const SigninState({
    this.phone = const PhoneInput.pure(),
    this.password = '',
    this.isValid = false
  });

  SigninState copyWith({
    PhoneInput? phone,
    String? password,
    bool? isValid
  }){
    return SigninState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid
    );
  }
}