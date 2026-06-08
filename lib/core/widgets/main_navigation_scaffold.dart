import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_bottom_nav_bar.dart';

class MainNavigationScaffold extends StatelessWidget {
  const MainNavigationScaffold({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(final BuildContext context,) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(navigationShell: navigationShell),
    );
  }
}
