import 'package:flutter/material.dart';

class Themes {

  static ThemeData mainTheme() => ThemeData(

    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow)
        .copyWith(
      brightness: Brightness.dark,
    ),
  );
}