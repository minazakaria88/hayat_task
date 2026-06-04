import 'package:flutter/material.dart';
import 'package:haya/core/routing/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              router.goNamed(AppRouter.login.name);
            },
            icon: const Icon(Icons.logout),
          ),
          const Text('Home'),
        ],
      ),
    );
  }
}
