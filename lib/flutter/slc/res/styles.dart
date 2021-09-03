import 'package:flutter/material.dart';
import 'colors.dart';

class SlcStyles {
  //查看所端字体的默认颜色在[Typography]类中
  //全局主题
  //listView Item根据主题设置为白色或黑色时可考虑使用cardColor
  static final ThemeData appTheme = new ThemeData(
      primarySwatch: SlcColors.primarySwatch,
      //scaffoldBackgroundColor: SlcColors.colorBackground,
      hintColor: SlcColors.globalHintTextColorBlack
  );

  //全局默认第一颜色字体请使用 themeData.primaryTextTheme.subtitle1
  //全局默认第二颜色字体高亮
  static final TextStyle globalSecondaryTextStyleHighlight =
  TextStyle(color: SlcColors.globalSecondaryTextColorBlack);

  //全局默认第二颜色字体暗黑
  static final TextStyle globalSecondaryTextStyleDark =
  TextStyle(color: SlcColors.globalSecondaryTextColorWhite);

  //全局默认第三颜色字体高亮
  static final TextStyle globalHintTextStyleHighlight =
  TextStyle(color: SlcColors.globalHintTextColorBlack);

  //全局默认第三颜色字体暗黑
  static final TextStyle globalHintTextStyleDark =
  TextStyle(color: SlcColors.globalHintTextColorWhite);

  //全局浮动LabelText高亮
  static final TextStyle globalLabelFloatTextStyleHighlight =
  globalHintTextStyleHighlight.copyWith(fontSize: 12);

  //全局浮动LabelText暗黑
  static final TextStyle globalLabelFloatTextStyleDark =
  globalHintTextStyleDark.copyWith(fontSize: 12);

  //根据主题获取第二字体颜色
  static TextStyle getTextColorSecondaryStyleByTheme(ThemeData themeData) {
    return getTextColorSecondaryStyleByDark(
        themeData.brightness == Brightness.dark);
  }

  //根据主题获取第二字体颜色
  static TextStyle getTextColorSecondaryStyleByDark(bool isDark) {
    if (isDark) {
      return globalSecondaryTextStyleDark;
    } else {
      return globalSecondaryTextStyleHighlight;
    }
  }

  //根据主题获取第三字体颜色
  static TextStyle getTextColorHintStyleByTheme(ThemeData themeData) {
    return getTextColorHintStyleByDark(themeData.brightness == Brightness.dark);
  }

  //根据主题获取第三字体颜色
  static TextStyle getTextColorHintStyleByDark(bool isDark) {
    if (isDark) {
      return globalHintTextStyleDark;
    } else {
      return globalHintTextStyleHighlight;
    }
  }

  //根据主题获取LabelTextStyle
  static TextStyle getLabelFloatTextStyleByTheme(ThemeData themeData) {
    return getLabelFloatTextStyleByDark(
        themeData.brightness == Brightness.dark);
  }

  //根据主题获取LabelTextStyle
  static TextStyle getLabelFloatTextStyleByDark(bool isDark) {
    if (isDark) {
      return globalLabelFloatTextStyleDark;
    } else {
      return globalLabelFloatTextStyleHighlight;
    }
  }

  static SizedBox getSizedBox({double width = 0, double height = 0}) {
    return SizedBox.fromSize(size: Size(width, height));
  }

}
