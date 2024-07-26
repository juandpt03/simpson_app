import 'package:flutter/material.dart';

class AppTheme {
  final bool isDark;
  Color seedColor = const Color.fromARGB(255, 255, 213, 0);

  AppTheme({this.isDark = false});

  get theme => ThemeData(
        colorSchemeSeed: seedColor,
        brightness: isDark ? Brightness.dark : Brightness.light,
      );
}
