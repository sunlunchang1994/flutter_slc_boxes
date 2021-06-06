import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlcImages {
  static BoxDecoration bgColorWhite4 = getBgBoxDecoration(Colors.white, 4);

  //获取背景装饰器
  static BoxDecoration getBgBoxDecoration(Color color, double radius) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
