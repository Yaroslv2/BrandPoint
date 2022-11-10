import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signIn() async {
    emit(LoginSign());
  }

  Future<void> createAccount() async {
    emit(LoginCreatNew());
  }

  Future<void> goBack() async {
    emit(LoginPreLogin());
  }
}
