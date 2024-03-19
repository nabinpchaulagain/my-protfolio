import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mywebsite/core/color/colors.dart';

class AppTheme {
  static ThemeData themeData(bool isLightTheme, BuildContext context) {
    return isLightTheme ? ThemeColors.darkTheme : ThemeColors.lightTheme;
  }
}

class ThemeColors {
  const ThemeColors._();

  static const lightBackgroundColor = Colors.white;
  static const darkBackgroundColor = Colors.black;
  static const primaryColor = Colors.blue;
  static const lightTextColor = Colors.black;
  static const darkTextColor = Colors.white;

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Protest Riot',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackgroundColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: lightTextColor, fontWeight: FontWeight.bold),
    ),
    colorScheme: const ColorScheme.light(
      background: lightBackgroundColor,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Protest Riot',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkTextColor, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
    ),
    colorScheme: const ColorScheme.dark(
      background: darkBackgroundColor,
    ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;
}

extension ThemeExtras on ThemeData {
  Color get navBarColor => brightness == Brightness.light
      ? const Color(0xffF0F0F0)
      : const Color(0xFF00040F);
  //
  Color get textColor => brightness == Brightness.light
      ? const Color.fromARGB(255, 0, 0, 0)
      : const Color(0xFFFFF8F2);
  //
  Color get secondaryColor => const Color(0xFFFE53BB);
  //
  Gradient get serviceCard =>
      brightness == Brightness.light ? grayWhite : grayBack;

  //
  Gradient get contactCard =>
      brightness == Brightness.light ? grayWhite : contactGradi;
}
