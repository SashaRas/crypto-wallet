part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class ClickRegisterButton extends AuthEvent{
  final String email;
  final String password;
  ClickRegisterButton({required this.email, required this.password});
}

class ClickLoginButton extends AuthEvent{
  final String email;
  final String password;
  ClickLoginButton({required this.email, required this.password});
}
