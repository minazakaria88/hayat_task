import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haya/core/widgets/shimmer_item.dart';
import '../../../../core/widgets/error_widget.dart';
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
            return const ShimmerItem(
              width: double.infinity,
              height: 100,
              margin: 10,
            );
          } else if (state.profileStatus == ProfileStatus.failure) {
            return Center(
              child: AppErrorWidget(
                error: state.errorMessage ?? '',
                onRetry: () => context.read<ProfileCubit>().getProfile(),
              ),
            );
          } else {
            return ProfileCard(user: state.user!);
          }
        },
      ),
    );
  }
}
