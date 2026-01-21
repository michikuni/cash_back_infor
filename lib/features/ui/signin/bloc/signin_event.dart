
abstract class SigninEvent{}

class SigninSubmitEvent extends SigninEvent{}
class SigninOnPhoneChangedEvent extends SigninEvent{
  final String phone;
  SigninOnPhoneChangedEvent({required this.phone});
}
class SigninCountEvent extends SigninEvent{}