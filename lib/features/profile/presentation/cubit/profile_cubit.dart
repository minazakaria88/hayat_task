import 'package:bloc/bloc.dart';
import '../../data/datasources/profile_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/profile_model.dart';
part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRemoteDataSource})
    : super(const ProfileState());
  final ProfileRemoteDataSource profileRemoteDataSource;
  Future<void> getProfile() async {
    try {
      emit(state.copyWith(profileStatus: ProfileStatus.loading));
      final user = await profileRemoteDataSource.getProfileData();
      emit(state.copyWith(profileStatus: ProfileStatus.success, user: user));
    } catch (e) {
      emit(
        state.copyWith(
          profileStatus: ProfileStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
