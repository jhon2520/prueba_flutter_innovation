import 'package:flutter/material.dart';
import 'package:innovation_test/ui/ui.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        centerTitle: true, color: AppConst.primaryColor, elevation: 0),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppConst.primaryColor, elevation: 0),
  );
}
