import 'package:haya/features/profile/data/datasources/profile_remote_data_source.dart';

import '../models/profile_model.dart';

class ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepo({
    required this.profileRemoteDataSource,
  });

  Future<UserModel> getProfileData() async {
    return profileRemoteDataSource.getProfileData();
  }

}