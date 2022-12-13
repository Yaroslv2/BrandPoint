part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserInitialEvent extends UserEvent {}

class UserAuntheficationEvent extends UserEvent {
  String username;
  String password;
  String email;

  UserAuntheficationEvent(
      {required this.username, required this.password, required this.email});
}

class UserLogOutEvent extends UserEvent {}
