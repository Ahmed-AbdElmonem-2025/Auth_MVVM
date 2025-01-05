abstract class AuthStates {}

class InitialState extends AuthStates {}
 


class LoginSuccessState extends AuthStates {}
class LoginErrorState extends AuthStates {
  final String errorMsg;
  LoginErrorState(this.errorMsg);
}
class LoginLoadingState extends AuthStates {}

 









class ResetPasswordSuccessState extends AuthStates {}
class ResetPasswordLoadingState extends AuthStates {}
class ResetPasswordErrorState extends AuthStates {
  final String errorMsg;
  ResetPasswordErrorState(this.errorMsg);
}