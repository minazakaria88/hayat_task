import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:haya/features/auth/presentation/pages/login_screen.dart';
import 'package:haya/features/auth/presentation/pages/register_screen.dart';
import 'package:haya/features/home/presentation/pages/home_screen.dart';
import 'package:haya/features/profile/presentation/pages/profile_screen.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../../injection.dart';
import '../widgets/main_navigation_scaffold.dart';

enum AppRouter { login, home, register, profile }

String initialRoute = '/';

final router = GoRouter(
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: '/login',
      name: AppRouter.login.name,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      name: AppRouter.register.name,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const RegisterScreen(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: AppRouter.home.name,
              builder: (context, state) => BlocProvider(
                create: (context) => getIt<HomeCubit>()..getTodos(),
                child: const HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: AppRouter.profile.name,
              builder: (context, state) => BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getProfile(),
                child: const ProfileScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
