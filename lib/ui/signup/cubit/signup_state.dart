import '../form/name_input.dart';
import 'package:formz/formz.dart';
import '../form/phone_input.dart';
import '../form/password_input.dart';
import '../form/confirm_password_input.dart';

abstract class SignupFormValidationState {
  const SignupFormValidationState();
}

enum SignupStep { phone, password, nameInput, birthSelection, englishLevel }

enum EnglishLevel { unknown, word, sentence, paragraph }

class SignupState extends SignupFormValidationState {
  final SignupStep step;
  final PhoneInput phone;
  final PasswordInput password;
  final ConfirmPasswordInput confirmPassword;
  final NameInput name;
  final int birthSelection;
  final EnglishLevel englishLevel;
  final FormzSubmissionStatus status;
  final bool isValid;

  const SignupState({
    this.step = SignupStep.phone,
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmPasswordInput.pure(),
    this.phone = const PhoneInput.pure(),
    this.name = const NameInput.pure(),
    this.birthSelection = 2010,
    this.englishLevel = EnglishLevel.word,
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  SignupState copyWith({
    SignupStep? step,
    PhoneInput? phone,
    PasswordInput? password,
    ConfirmPasswordInput? confirmPassword,
    NameInput? name,
    int? birthSelection,
    EnglishLevel? englishLevel,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return SignupState(
      step: step ?? this.step,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      birthSelection: birthSelection ?? this.birthSelection,
      englishLevel: englishLevel ?? this.englishLevel,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  bool get isStepValid {
    switch (step) {
      case SignupStep.phone:
        return phone.isValid;
      case SignupStep.password:
        return password.isValid;
      case SignupStep.nameInput:
        return name.isValid;
      case SignupStep.birthSelection:
        return true;
      case SignupStep.englishLevel:
        return true;
    }
  }
}
