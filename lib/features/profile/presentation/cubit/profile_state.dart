part of 'profile_cubit.dart';



enum ProfileStatus { initial, loading, success, failure }

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileStatus.initial) ProfileStatus profileStatus,
    String? errorMessage,
    final UserModel? user,
  }) = _ProfileState;
}
