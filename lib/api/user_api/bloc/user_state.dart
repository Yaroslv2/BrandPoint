part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserLogInState extends UserState {}

class UserLoadingState extends UserState {}

class UserLogOutState extends UserState {}
