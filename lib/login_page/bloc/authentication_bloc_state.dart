part of 'authentication_bloc_bloc.dart';

@immutable
abstract class AuthenticationBlocState {}

class AuthenticationBlocInitial extends AuthenticationBlocState {}

class LoginSuccess extends AuthenticationBlocState {}

class LoginFailed extends AuthenticationBlocState {
  LoginFailed({required this.message});
  String message;
}
