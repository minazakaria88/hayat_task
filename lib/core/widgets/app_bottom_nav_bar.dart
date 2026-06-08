

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/core/helpers/extensions.dart';

import '../utils/app_colors.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _onTap(final BuildContext context, final int index) {
    navigationShell.goBranch(initialLocation: true, index);
  }

  @override
  Widget build(final BuildContext context) {
    final theme = context.theme;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: .1),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        onTap: (final int index) => _onTap(context, index),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 25,),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 20,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.secondaryTextColor,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
