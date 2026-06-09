import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/core/helpers/sizes.dart';
import 'package:haya/core/widgets/shimmer_item.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../injection.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
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
            return Column(
              children: [
                ProfileCard(user: state.user!),
                Sizes.verticalSpace(AppSpacing.lg),
                _buildLogoutButton(),
              ],
            );
          }
        },
      ),
    );
  }

  BlocProvider<AuthCubit> _buildLogoutButton() {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            previous.logoutStatus != current.logoutStatus,
        listenWhen: (previous, current) =>
            previous.logoutStatus != current.logoutStatus,
        listener: (context, state) {
          if (state.logoutStatus == LogoutStatus.success) {
            context.goNamed(AppRouter.login.name);
          }
        },
        builder: (context, state) {
          return state.logoutStatus == LogoutStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      context.read<AuthCubit>().logout();
                    },
                  ),
                );
        },
      ),
    );
  }
}
