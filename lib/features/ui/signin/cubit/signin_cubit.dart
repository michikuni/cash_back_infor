import 'package:cash_back_infor/domain/usecase/get_user_use_case.dart';
import 'package:cash_back_infor/features/ui/signin/cubit/signin_state.dart';
import 'package:cash_back_infor/features/ui/signin/form/phone_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({required this.getUserUseCase}) : super(const SigninState());
  final GetUserUseCase getUserUseCase;

  void phoneChanged(String value) {
    final phone = PhoneInput.dirty(value);
    emit(state.copyWith(phone: phone, isValid: Formz.validate([phone])));
  }

  void countSignin() {
    final newCount = state.signCount + 1;
    emit(state.copyWith(signCount: newCount));
  }

  void submit() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final response = await getUserUseCase().run();
    response.fold(
      (error) => emit(state.copyWith(status: FormzSubmissionStatus.failure)),
      (data) => emit(
        state.copyWith(status: FormzSubmissionStatus.success, userData: data),
      ),
    );
  }
}
