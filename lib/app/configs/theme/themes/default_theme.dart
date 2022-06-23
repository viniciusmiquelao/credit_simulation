import 'package:flutter/material.dart';

import '../custom_theme.dart';

final defaultTheme = CustomThemeData(
  colors: CustomColorsThemeData(
    background: const Color(0xFFFFFFFFF),

    //Input

    inputSelected: const Color(0xFFF0F0F3),
    inputText: const Color(0xFF7F8B9F),
    inputUnselected: const Color(0xFF27AE60),
    inputError: const Color(0xFFF03D3E),

    //Text
    title: const Color(0xFF000000),
    text: const Color(0xFF000000),

    //Button
    button: const Color(0xFF52a2a6),

    //Pallete Color
    //Neutral
    gray500: const Color(0xFF606165),
    gray150: const Color(0xFF7F8B9F),
    gray50: const Color(0xFFF0F0F3),

    //Primary
    primary: const Color(0xFF52a2a6),

    //Success
    success: const Color(0xFF27AE60),
    //Danger
    error: const Color(0xFFF03D3E),
    //Warning
    warning: const Color(0xFFFFA928),
    //info
    info: const Color(0xFFEBF4FA),
  ),
  textTheme: CustomTextThemeData(
    h1: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    h2: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    h3: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    h4: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    h5: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    body1: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    body2: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    body3: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    button: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);
