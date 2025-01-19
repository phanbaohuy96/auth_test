part of 'signin_bloc.dart';

abstract class SigninEvent {}

class LoginEvent extends SigninEvent {
  final String username;
  final String password;

  LoginEvent({
    required this.username,
    required this.password,
  });
}
