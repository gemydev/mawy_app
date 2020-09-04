part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class LoginEvent extends RegisterEvent {
  final User user ;

  LoginEvent({this.user});

  @override
  List<Object> get props => [user];

}

class SignUpEvent extends RegisterEvent {
  final User user ;

  SignUpEvent({this.user});

  @override
  List<Object> get props => throw UnimplementedError();

}

