  import 'package:formz/formz.dart';
  import '../form/phone_input.dart';
  import '../form/password_input.dart';
  import '../form/confirm_password_input.dart';

  abstract class SignupFormValidationState{
    const SignupFormValidationState();
  }

  enum SignupStep {
  phone,
  password,
}


  class SignupState extends SignupFormValidationState{
    final SignupStep step;
    final PhoneInput phone;
    final PasswordInput password;
    final ConfirmPasswordInput confirmPassword;
    final FormzSubmissionStatus status;
    final bool isValid;

    const SignupState({
      this.step = SignupStep.phone,
      this.password = const PasswordInput.pure(),
      this.confirmPassword = const ConfirmPasswordInput.pure(),
      this.phone = const PhoneInput.pure(),
      this.isValid = false,
      this.status = FormzSubmissionStatus.initial,
    });

    SignupState copyWith({
      SignupStep? step,
      PhoneInput? phone,
      PasswordInput? password,
      ConfirmPasswordInput? confirmPassword,
      bool? isValid,
      FormzSubmissionStatus? status,
    }) {
      return SignupState(
        step: step ?? this.step,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        isValid: isValid ?? this.isValid,
        status: status ?? this.status,
      );
    }

    bool get isStepValid {
      switch(step){
        case SignupStep.phone:
          return phone.isValid;
        case SignupStep.password:
          return password.isValid;
      }
    }
  }
