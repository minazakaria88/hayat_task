import 'package:flutter/material.dart';
import 'package:haya/core/Locale/app_localizations.dart';

extension BuildContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  ScaffoldState get scaffoldState => Scaffold.of(this);
  TextDirection get textDirection => Directionality.of(this);
  ScaffoldMessengerState get scaffoldMessengerState =>
      ScaffoldMessenger.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;
  double get aspectRatio => width / height;
  double get pixelRatio => mediaQuery.devicePixelRatio;
} 