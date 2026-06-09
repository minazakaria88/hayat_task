part of 'auth_cubit.dart';


enum AuthStatus { initial, loading, success, failure }
enum LogoutStatus { initial, loading, success, failure }

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    @Default(LogoutStatus.initial) LogoutStatus logoutStatus,
    String? errorMessage,
  }) = _AuthState;
}
