import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haya/features/auth/data/repositories/auth_repo.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(const AuthState());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      await authRepo.login(email: email, password: password);
      emit(state.copyWith(authStatus: AuthStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      await authRepo.register(email: email, password: password, name: name);
      emit(state.copyWith(authStatus: AuthStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }


  Future<void> logout() async {
    try {
      emit(state.copyWith(logoutStatus: LogoutStatus.loading));
      await authRepo.logout();
      emit(state.copyWith(logoutStatus: LogoutStatus.success));
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          logoutStatus: LogoutStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
