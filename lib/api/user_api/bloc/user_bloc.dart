import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/api/user_api/api.dart';
import 'package:test_project/api/user_api/token.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      switch (event.runtimeType) {
        case UserInitialEvent:
          await tokenAunthefication(event as UserInitialEvent, emit);
          break;
        case UserAuntheficationEvent:
          await userAunthefication(event as UserAuntheficationEvent, emit);
          break;
        case UserLogOutEvent:
          await userLogOut(event as UserLogOutEvent, emit);
      }
    });
  }

  Future<void> tokenAunthefication(UserInitialEvent event, Emitter emit) async {
    print("Token1");
    final token = await readToken();
    if (token != null && postUser(token[0], token[1], token[2]) == 200) {
      print("Token");
      emit(UserLogInState());
    } else {
      print("Token");
      emit(UserLogOutState());
    }
  }

  Future<void> userAunthefication(
      UserAuntheficationEvent event, Emitter emit) async {
    print("Aunth");
    if (postUser(event.email, event.password, event.username) == 200) {
      saveToken(event.email, event.password, event.username);
      emit(UserLogInState());
    } else {
      emit(UserLogOutState());
    }
  }

  Future<void> userLogOut(UserLogOutEvent event, Emitter emit) async {
    removeToken();
    emit(UserLogOutState());
  }
}
