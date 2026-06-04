import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haya/core/Locale/app_localizations.dart';
import 'package:haya/core/routing/app_router.dart';
import 'package:haya/core/routing/app_startup.dart';

class HayaApp extends StatelessWidget {
  const HayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Haya',
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      builder: (context, child) {
        return AppStartupWidget(child: child!);
      },
    );
  }
}
