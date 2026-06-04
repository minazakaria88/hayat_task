import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haya/core/helpers/extenstions.dart';
import 'package:haya/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage ?? '')));
        }
        if (state.authStatus == AuthStatus.success) {
          context.scaffoldMessengerState.showSnackBar(
            SnackBar(
              content: Text('Login Success'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) =>
                  state.authStatus == AuthStatus.loading
                  ? CircularProgressIndicator()
                  : IconButton(
                      onPressed: () {
                        cubit.login(email: '', password: '');
                      },
                      icon: const Icon(Icons.logout),
                    ),
            ),
            const Text('Login'),
          ],
        ),
      ),
    );
  }
}
