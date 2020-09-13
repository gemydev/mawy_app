import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mawy_app/data/models/models.dart';
import 'package:mawy_app/data/repositries/repositries.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({this.repository}) : super(RegisterInitial());
  final RegisterRepositoryApi repository;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield AuthenticationLoading();
      try {
        await repository.login(
            userName: event.userName,
            password: event.password,
            firebaseToken: event.firebaseToken);
        yield LoginState(done: repository.loginDone , user: await repository.login());
      } catch (e) {
        yield ErrorState(message: "error founded");
      }
    }
    if (event is SignUpEvent) {
      yield AuthenticationLoading();
      try {
        await repository.signUp(
            userName: event.userName,
            phone: event.phone,
            address: event.address,
            password: event.password,
            firebaseToken: event.firebaseToken);
        yield SignUpState();
      } catch (e) {
        yield ErrorState(message: "error");
      }
    }
  }
}
