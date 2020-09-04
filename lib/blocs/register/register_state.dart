part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoginState extends RegisterState {
  final int statusCode ;
  final String token;
  
  LoginState({this.statusCode , this.token});

  @override
  List<Object> get props => [token];
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
