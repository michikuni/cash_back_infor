import '../../../domain/usecase/get_user_use_case.dart';
import '../cubit/signin_state.dart';
import '../form/phone_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({required this.getUserUseCase}) : super(const SigninState());
  final GetUserUseCase getUserUseCase;

  void phoneChanged(String value) {
    final phone = PhoneInput.dirty(value);
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([phone]),
      ),
    );
  }

  void submit() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try{
      final response = await getUserUseCase();
      emit(state.copyWith(status: FormzSubmissionStatus.success, userData: response));
    }catch(e){
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
