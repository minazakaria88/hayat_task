import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/core/helpers/app_regex.dart';
import 'package:haya/core/helpers/extensions.dart';
import 'package:haya/core/helpers/sizes.dart';
import 'package:haya/core/widgets/app_button.dart';
import 'package:haya/core/widgets/my_text_form_field.dart';
import 'package:haya/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/routing/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            const SnackBar(
              content: Text('Login Success'),
              backgroundColor: Colors.green,
            ),
          );
          context.goNamed(AppRouter.home.name);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: EdgeInsets.all(Sizes.pagePadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextFormField(
                  controller: _emailController,
                  hint: 'Email',
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Email is required';
                    }
                    if (!AppRegex.isEmailValid(value!)) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                ),
                Sizes.verticalSpace(AppSpacing.lg),
                _buildPasswordInput(),
                Sizes.verticalSpace(AppSpacing.lg),
                _buildLoginButton(cubit),
                Sizes.verticalSpace(AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    InkWell(
                      onTap: () => context.pushNamed(AppRouter.register.name),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<AuthCubit, AuthState> _buildLoginButton(AuthCubit cubit) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => state.authStatus == AuthStatus.loading
          ? const CircularProgressIndicator()
          : MyButton(
              title: 'Login',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  cubit.login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }
              },
            ),
    );
  }

  ValueListenableBuilder<bool> _buildPasswordInput() {
    return ValueListenableBuilder(
      valueListenable: isPasswordVisible,
      builder: (context, value, child) => AppTextFormField(
        isObscureText: isPasswordVisible.value,
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            isPasswordVisible.value = !isPasswordVisible.value;
          },
        ),
        controller: _passwordController,
        hint: 'Password',
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return 'Password is required';
          }
          if (!AppRegex.isPasswordValid(value!)) {
            return 'Password is not valid';
          }
          return null;
        },
      ),
    );
  }
}
