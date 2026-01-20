import 'package:cash_back_infor/data/models/user.dart';
import 'package:cash_back_infor/domain/usecase/create_user_use_case.dart';
import 'package:cash_back_infor/domain/usecase/get_user_use_case.dart';
import 'package:cash_back_infor/features/ui/signup/form/confirm_password_input.dart';
import 'package:cash_back_infor/features/ui/signup/form/name_input.dart';
import 'package:cash_back_infor/features/ui/signup/form/password_input.dart';
import 'package:cash_back_infor/features/ui/signup/form/phone_input.dart';
import 'package:cash_back_infor/features/ui/signup/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.createUserUseCase, required this.getUserUseCase})
    : super(const SignupState());
  final GetUserUseCase getUserUseCase;
  final CreateUserUseCase createUserUseCase;

  void phoneChanged(String value) {
    final phone = PhoneInput.dirty(value);
    emit(state.copyWith(phone: phone, isValid: Formz.validate([phone])));
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(password: password, isValid: Formz.validate([password])),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPasswordInput.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([confirmPassword]),
      ),
    );
  }

  void nameChanged(String value) {
    final name = NameInput.dirty(value);
    emit(state.copyWith(name: name, isValid: Formz.validate([name])));
  }

  void birthSelected(int birth) {
    emit(state.copyWith(birthSelection: birth));
  }

  void englishLevel(EnglishLevel englishLevel) {
    emit(state.copyWith(englishLevel: englishLevel));
  }

  void nextStep() {
    if (!state.isStepValid) return;

    switch (state.step) {
      case SignupStep.phone:
        emit(state.copyWith(step: SignupStep.password));
        break;
      case SignupStep.password:
        break;
    }
  }

  bool buttonState() {
    if (state.step == SignupStep.phone && state.phone.isValid) {
      return true;
    }
    if (state.step == SignupStep.password &&
        state.password.isValid &&
        state.confirmPassword.isValid) {
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final user = UserModel(
      phone: state.phone.value,
      password: state.password.value,
      dob: state.birthSelection,
      englishLevel: state.englishLevel.name,
      name: state.name.value,
    );
    // print(state.englishLevel.name);
    final response = await createUserUseCase(user).run();
    response.fold(
      (errorMessage) {
        print(errorMessage);
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      },
      (userEntity) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      },
    );
  }
}
