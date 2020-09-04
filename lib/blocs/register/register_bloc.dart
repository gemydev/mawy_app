import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mawy_app/data/register_repository.dart';
import 'package:mawy_app/models/user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerRepository) : super(RegisterInitial());
  final RegisterRepository registerRepository;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is LoginEvent) {
      try {
        await registerRepository.registerRepositoryApi.login(event.user);
        yield LoginState();
      } catch (e) {
        yield ErrorState(message: "error founded");
      }
    }
    if (event is SignUpEvent) {
      try {
        await registerRepository.registerRepositoryApi.signUp(event.user);
        yield SignUpState();
      } catch (e) {
        yield ErrorState(message: "error");
      }
    }
  }
}
