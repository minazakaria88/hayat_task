part of 'auth_cubit.dart';


enum AuthStatus { initial, loading, success, failure }

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    String? errorMessage,
  }) = _AuthState;
}
