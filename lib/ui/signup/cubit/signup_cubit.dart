import 'package:cash_back_infor/ui/signup/form/confirm_password_input.dart';
import 'package:cash_back_infor/ui/signup/form/name_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'signup_state.dart';
import '../form/phone_input.dart';
import '../form/password_input.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState());

  void phoneChanged(String value) {
    final phone = PhoneInput.dirty(value);
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([phone])
      ),
    );
  }

  void passwordChanged(String value){
    final password = PasswordInput.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password])
    ));
  }

  void confirmPasswordChanged(String value){
    final confirmPassword = ConfirmPasswordInput.dirty(password: state.password.value, value: value);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isValid: Formz.validate([confirmPassword])
    ));
  }

  void nameChanged(String value){
    final name = NameInput.dirty(value);
    emit(state.copyWith(
      name: name,
      isValid: Formz.validate([name])
    ));
  }

  void birthSelected(int birth){
    emit(state.copyWith(
      birthSelection: birth
    ));
  }

  void englishLevel(EnglishLevel englishLevel){
    emit(state.copyWith(
      englishLevel: englishLevel
    ));
  }

  void nextStep(){
    if(!state.isStepValid) return;

    switch(state.step){
      case SignupStep.phone: emit(state.copyWith(step: SignupStep.password)); break;
      case SignupStep.password: break;
      case SignupStep.nameInput: emit(state.copyWith(step: SignupStep.birthSelection)); break;
      case SignupStep.birthSelection: emit(state.copyWith(step: SignupStep.englishLevel)); break;
      case SignupStep.englishLevel: break;
    }
  }

  bool buttonState(){
    if(state.step == SignupStep.phone && state.phone.isValid) {return true;}
    if(state.step == SignupStep.password && state.password.isValid && state.confirmPassword.isValid) {return true;}
    else {return false;}
  }

  void submit() {
    final phone = PhoneInput.dirty(state.phone.value);
    final password = PasswordInput.dirty(state.password.value);
    final isValid = Formz.validate([phone]);
    if(!isValid){
      emit(state.copyWith(
        phone: phone,
        password: password,
        isValid: false,
        status: FormzSubmissionStatus.failure
      ));
      return ;
    }
    emit(state.copyWith(
      phone: phone,
      password: password,
      isValid: true,
      status: FormzSubmissionStatus.success
    ));
  }
}
