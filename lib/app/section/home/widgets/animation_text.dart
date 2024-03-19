import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:mywebsite/app/changes/string.dart';
import 'package:mywebsite/core/configs/others/app_typography.dart';

List<TyperAnimatedText> desktopList = [
  TyperAnimatedText(animationtxt1,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 32)),
  TyperAnimatedText(animationtxt2,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 32)),
  TyperAnimatedText(animationtxt3,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 32))
];

List<TyperAnimatedText> tabList = [
  TyperAnimatedText(animationtxt1,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 20)),
  TyperAnimatedText(animationtxt2,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 20)),
  TyperAnimatedText(animationtxt3,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 20))
];
List<TyperAnimatedText> mobileList = [
  TyperAnimatedText(animationtxt1,
      speed: const Duration(milliseconds: 100),
      textStyle: AppText.h2!.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )),
  TyperAnimatedText(animationtxt2,
      speed: const Duration(milliseconds: 100),
      textStyle: AppText.h2!.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )),
  TyperAnimatedText(animationtxt3,
      speed: const Duration(milliseconds: 100),
      textStyle: AppText.h2!.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ))
];
