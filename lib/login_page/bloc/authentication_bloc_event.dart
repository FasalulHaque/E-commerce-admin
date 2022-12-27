part of 'authentication_bloc_bloc.dart';

@immutable
abstract class AuthenticationBlocEvent {}

class LoginEvent extends AuthenticationBlocEvent {
  LoginEvent({required this.email, required this.password});
  String email;
  String password;
}
