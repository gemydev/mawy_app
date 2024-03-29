part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class LoginEvent extends RegisterEvent {
  final String userName, firebaseToken, password;

  LoginEvent({this.userName, this.firebaseToken, this.password});

  @override
  List<Object> get props => [userName, password, firebaseToken ];
}

class SignUpEvent extends RegisterEvent {
  final String userName, address, phone, password, firebaseToken;


  SignUpEvent(
      {this.userName,
      this.address,
      this.phone,
      this.password,
      this.firebaseToken });

  @override
  List<Object> get props => [userName, address, password, phone, firebaseToken];
}
