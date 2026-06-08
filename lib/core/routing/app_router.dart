import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:haya/features/auth/presentation/pages/login_screen.dart';
import 'package:haya/features/auth/presentation/pages/register_screen.dart';
import 'package:haya/features/home/presentation/pages/home_screen.dart';
import '../../injection.dart';

enum AppRouter { login, home,register }

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
    GoRoute(
      path: '/home',
      name: AppRouter.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
