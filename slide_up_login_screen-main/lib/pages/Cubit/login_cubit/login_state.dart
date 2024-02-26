part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailuer extends LoginState {
  String errormessage;
  LoginFailuer({required this.errormessage});
}