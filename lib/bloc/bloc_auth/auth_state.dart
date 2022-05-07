part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthDone extends AuthState{
  final bool authOk;

  AuthDone(this.authOk);
}
