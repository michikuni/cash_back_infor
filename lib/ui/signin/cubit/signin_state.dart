import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:formz/formz.dart';

import '../form/phone_input.dart';

class SigninState {
  final PhoneInput phone;
  final String password;
  final bool isValid;
  final FormzSubmissionStatus status;
  final List<UserEntity> userData;

  const SigninState({
    this.phone = const PhoneInput.pure(),
    this.password = '',
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.userData = const []
  });

  SigninState copyWith({
    PhoneInput? phone,
    String? password,
    bool? isValid,
    FormzSubmissionStatus? status,
    List<UserEntity>? userData
  }) {
    return SigninState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      userData: userData ?? this.userData
    );
  }
}
