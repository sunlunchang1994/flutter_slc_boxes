import 'package:flutter/material.dart';

class SlcColors {
  //主题色
  static final MaterialColor primarySwatch = Colors.blue;

  //默认背景色
  static final Color colorBackground = Color(0xfff0f4f7);

  //全局默认第二颜色字体高亮
  static final Color globalSecondaryTextColorWhite = Colors.white70;

  //全局默认第二颜色字体暗黑
  static final Color globalSecondaryTextColorBlack = Colors.black.withOpacity(0.6);

  //全局默认第三颜色字体高亮
  static final Color globalHintTextColorWhite = Colors.white38;

  //全局默认第三颜色字体暗黑
  static final Color globalHintTextColorBlack = Colors.black38;

  //全局默认分轨器高亮
  static final Color globalDividerColorWhite = Colors.white12;

  //全局默认第三颜色字体暗黑
  static final Color globalDividerColorBlack = Colors.black12;

  //根据主题获取第二字体颜色
  static Color getTextColorSecondaryByTheme(ThemeData themeData) {
    return getTextColorSecondaryByDark(themeData.brightness == Brightness.dark);
  }

  //根据主题获取第二字体颜色
  static Color getTextColorSecondaryByDark(bool isDark) {
    if (isDark) {
      return globalSecondaryTextColorWhite;
    } else {
      return globalSecondaryTextColorBlack;
    }
  }

  //根据主题获取第二字体颜色
  static Color getTextColorHintByTheme(ThemeData themeData) {
    return getTextColorHintByDark(themeData.brightness == Brightness.dark);
  }

  //根据主题获取第三字体颜色
  static Color getTextColorHintByDark(bool isDark) {
    if (isDark) {
      return globalHintTextColorWhite;
    } else {
      return globalHintTextColorBlack;
    }
  }

  //根据主题获取分轨器颜色
  static Color getDividerColorByTheme(ThemeData themeData) {
    return getDividerColorByDark(themeData.brightness == Brightness.dark);
  }

  //根据主题获取分轨器颜色
  static Color getDividerColorByDark(bool isDark) {
    if (isDark) {
      return globalHintTextColorWhite;
    } else {
      return globalHintTextColorBlack;
    }
  }
}
