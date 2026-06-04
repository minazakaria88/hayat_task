import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haya/features/auth/data/repositories/auth_repo.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';                                                                                                                           


class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthState());
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
}
