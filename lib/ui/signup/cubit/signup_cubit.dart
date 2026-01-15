import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'signup_state.dart';
import '../form/phone_input.dart';

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

  void submit() {
    final phone = PhoneInput.dirty(state.phone.value);  
    final isValid = Formz.validate([phone]);
    if(!isValid){
      emit(state.copyWith(
        phone: phone,
        isValid: false,
      ));
      return ;
    }
    emit(state.copyWith(
      phone: phone,
      isValid: true,
      status: FormzSubmissionStatus.success
    ));
  }
}
