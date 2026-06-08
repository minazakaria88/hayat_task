import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haya/core/helpers/extensions.dart';
import 'package:haya/core/networking/api_service.dart';
import 'package:haya/core/routing/app_router.dart';
import 'package:haya/core/services/cache_helper.dart';
import 'package:haya/injection.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';

class AppStartupWidget extends StatelessWidget {
  const AppStartupWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return BlocProvider(
      create: (context) => AppStartupCubit()..startUp(),
      child: Scaffold(
        body: BlocBuilder<AppStartupCubit, AppStartupState>(
          builder: (context, state) {
            if (state is AppStartupSuccess) {
              return child;
            } else if (state is AppStartupFailure) {
              return Scaffold(
                body: Column(
                  children: [
                    Center(child: Text(localization.someThingWentWrong)),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AppStartupCubit>().startUp();
                      },
                      child: Text(localization.retry),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

sealed class AppStartupState {}

class AppStartupInitial extends AppStartupState {}

class AppStartupSuccess extends AppStartupState {}

class AppStartupFailure extends AppStartupState {}

class AppStartupLoading extends AppStartupState {}

class AppStartupCubit extends Cubit<AppStartupState> {
  AppStartupCubit() : super(AppStartupInitial());

  Future<void> startUp() async {
    emit(AppStartupLoading());
    try {
      await CacheHelper.init();
      await ApiService.init();
      setupServiceLocator();
      final authLocalDataSource = getIt<AuthLocalDataSource>();
      final isLoggedIn = await authLocalDataSource.checkTokenIsExist();
      if (isLoggedIn) {
        router.goNamed(AppRouter.home.name);
      } else {
        router.goNamed(AppRouter.login.name);
      }
      emit(AppStartupSuccess());
    } catch (e) {
      emit(AppStartupFailure());
    }
  }
}
