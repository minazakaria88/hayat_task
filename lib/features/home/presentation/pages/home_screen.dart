import 'package:flutter/material.dart';
import 'package:haya/core/routing/app_router.dart';
import 'package:haya/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.images.image.path),
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
