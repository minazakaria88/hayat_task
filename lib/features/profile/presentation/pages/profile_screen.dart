import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/profile_cubit.dart';
import '../widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.profileStatus == ProfileStatus.loading ||
              state.profileStatus == ProfileStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.profileStatus == ProfileStatus.failure) {
            return Center(child: Text(state.errorMessage ?? ''));
          } else {
            return ProfileCard(user: state.user!);
          }
        },
      ),
    );
  }
}
