part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSign extends LoginState {}

class LoginCreatNew extends LoginState {}

class LoginPreLogin extends LoginState {}
