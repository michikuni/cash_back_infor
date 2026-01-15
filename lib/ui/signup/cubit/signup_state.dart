  import 'package:formz/formz.dart';
  import '../form/phone_input.dart';

  abstract class SignupFormValidationState{
    const SignupFormValidationState();
  }

  class SignupState extends SignupFormValidationState{
    final PhoneInput phone;
    final FormzSubmissionStatus status;
    final bool isValid;

    const SignupState({
      this.phone = const PhoneInput.pure(),
      this.isValid = false,
      this.status = FormzSubmissionStatus.initial,
    });

    SignupState copyWith({
      PhoneInput? phone,
      bool? isValid,
      FormzSubmissionStatus? status,
    }) {
      return SignupState(
        phone: phone ?? this.phone,
        isValid: isValid ?? this.isValid,
        status: status ?? this.status,
      );
    }
  }
