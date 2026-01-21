import 'package:cash_back_infor/domain/usecase/get_user_use_case.dart';
import 'package:cash_back_infor/features/ui/signin/bloc/signin_event.dart';
import 'package:cash_back_infor/features/ui/signin/cubit/signin_state.dart';
import 'package:cash_back_infor/features/ui/signin/form/phone_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final GetUserUseCase getUserUseCase;
  SigninBloc({required this.getUserUseCase}) : super(SigninState()) {
    on<SigninSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await getUserUseCase().run();
      response.fold(
        (onLeft) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (onRight) {
          emit(state.copyWith(userData: onRight, status: FormzSubmissionStatus.success));
        },
      );
    });
    on<SigninOnPhoneChangedEvent>((event, emit) {
      final PhoneInput phone = PhoneInput.dirty(event.phone);
      emit(state.copyWith(isValid: Formz.validate([phone]),phone: phone));
    },);
    on<SigninCountEvent>((event, emit) {
      emit(state.copyWith(signCount: state.signCount+1));
    },);

  }
}
