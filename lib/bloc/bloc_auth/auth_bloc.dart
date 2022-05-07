import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fire_book/net/firebaseAuthentication.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if(event is ClickLoginButton){
        bool loginOk = await login(event.email, event.password);
        yield AuthDone(loginOk);
      } else if(event is ClickRegisterButton){
        bool registerOk = await register(event.email, event.password);
        yield AuthDone(registerOk);
      }
    } catch (e) {
      print(e);
    }
  }
}
