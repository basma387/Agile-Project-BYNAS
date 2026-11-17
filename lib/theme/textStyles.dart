import 'package:bynas/theme/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle titleBlack = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: ColorManager.navy,
    fontFamily: 'Plus Jakarta Sans',
  );

  static TextStyle titleWhite = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ColorManager.beige,
    fontFamily: 'Plus Jakarta Sans',
  );

  static TextStyle subtitleBlack = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ColorManager.navy,
    fontFamily: 'JetBrains Mono',
  );

  static TextStyle subtextGrey = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: 'JetBrains Mono',
  );

  static TextStyle subtextBlue = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: ColorManager.blue,
    fontFamily: 'JetBrains Mono',
  );
}