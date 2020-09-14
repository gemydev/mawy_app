part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoginState extends RegisterState {
  final UserData user ;
  final loginDone;
  LoginState({this.user , this.loginDone});

  @override
  List<Object> get props => [user];

}

class SignUpState extends RegisterState {
  @override
  List<Object> get props => [];
}

class ErrorState extends RegisterState {
  final String message;
  ErrorState({this.message});

  @override
  List<Object> get props => [message];
}
