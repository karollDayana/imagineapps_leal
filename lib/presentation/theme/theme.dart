import 'package:flutter/material.dart';

ThemeData globalTheme() {
  TextTheme _globalTextTheme(TextTheme textTheme) {
    return textTheme.copyWith(
      headline4: textTheme.headline4?.copyWith(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700,
        fontSize: 40.0,
        color: const Color(0xFFFFFFFF),
        letterSpacing: 1.0,
      ),
      headline5: textTheme.headline5?.copyWith(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700,
        fontSize: 22.0,
        color: const Color(0xFF191919),
        letterSpacing: 1.0,
      ),
      bodyText1: textTheme.bodyText1?.copyWith(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: const Color(0xFF191919),
        letterSpacing: 1.0,
      ),
      button: textTheme.button?.copyWith(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        color: const Color(0xFF191919),
        letterSpacing: 1.0,
      ),
      caption: textTheme.caption?.copyWith(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
        color: const Color(0xFF8C8C8C),
        letterSpacing: 1.0,
      ),
    );
  }

  ColorScheme _colorSchemeTheme(ColorScheme themeColor) {
    return themeColor.copyWith(
      primary: const Color(0xFFFFD233),
      primaryContainer: const Color(0xFF191919),
      secondary: const Color(0xFF8C8C8C),
      secondaryContainer: const Color(0xFFFFFFFF),
    );
  }

  final ThemeData theme = ThemeData.light();

  return theme.copyWith(
    primaryColor: const Color(0xFFFFD233),
    colorScheme: _colorSchemeTheme(theme.colorScheme),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textTheme: _globalTextTheme(theme.textTheme),
  );
}
