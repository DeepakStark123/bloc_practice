abstract class SignInEvent {}

class SigInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SigInTextChangeEvent(this.emailValue, this.passwordValue);
}

class SigInSubmitedEvent extends SignInEvent {
  final String email;
  final String password;
  SigInSubmitedEvent(this.email, this.password);
}
