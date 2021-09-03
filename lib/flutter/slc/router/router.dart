import 'package:flutter/material.dart';
import '../code/observable_field.dart';

abstract class RouterWidget {
  factory RouterWidget._() => throw "cannot instantiate";

  void registerRouterEvent(BuildContext context, RouterVm routerVm) {
    routerVm.pushParameterOf.addListener(() {
      PushParameter? pushParameter =
          (routerVm.pushParameterOf as ObservableField<PushParameter>).value;
      if (pushParameter != null && pushParameter.page != null) {
        startByPage(context, pushParameter.page,
            routeSettings: pushParameter.routeSettings,
            requestCode: pushParameter.requestCode,
            finish: pushParameter.finish);
        /*if (pushParameter.isFinish) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(
                  builder: (context) => pushParameter.page,
                  settings: pushParameter.routeSettings))
              .then((value) => onResult(value));
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => pushParameter.page,
                  settings: pushParameter.routeSettings))
              .then((value) => onResult(value));
        }*/
      }
    });
    routerVm.finishOf.addListener(() {
      dynamic value = (routerVm.finishOf as ObservableField<dynamic>).value;
      if (value != null) {
        Navigator.of(context).pop(value);
        return;
      }
      Navigator.of(context).pop();
    });
  }

  ///启动页面
  void startByPage(BuildContext context, Widget page,
      {RouteSettings? routeSettings, int requestCode = 0, bool finish: false}) {
    startByPageAndListener(context, page,
        routeSettings: routeSettings, finish: finish)
        .then((value) => onResult(requestCode, value));
  }

  ///启动并且监听
  Future<dynamic> startByPageAndListener(BuildContext context, Widget page,
      {RouteSettings? routeSettings, bool finish: false}) {
    if (finish) {
      return Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => page, settings: routeSettings));
    } else {
      return Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page, settings: routeSettings));
    }
  }

  void onResult(int requestCode, dynamic result) {}
}

///loading dialog的VM
///使用混入引用
abstract class RouterVm {
  factory RouterVm._() => throw "cannot instantiate";
  final ObservableField<PushParameter> _pushParameterOf =
  ObservableField(single: true);
  final ObservableField<dynamic> _finishOf = ObservableField(single: true);

  Listenable get pushParameterOf => _pushParameterOf;

  Listenable get finishOf => _finishOf;

  startByPage(Widget page,
      {RouteSettings? routeSettings, int requestCode = 0, bool finish: false}) {
    _pushParameterOf.value = PushParameter(page,
        routeSettings: routeSettings, requestCode: requestCode, finish: finish);
  }

  startByPushParameter(PushParameter pushParameter) {
    _pushParameterOf.value = pushParameter;
  }

  finish({dynamic result}) {
    if (result == _finishOf.value) {
      _finishOf.notifyListeners();
    } else {
      _finishOf.value = result;
    }
  }
}

class PushParameter {
  Widget page;
  RouteSettings? routeSettings;
  int requestCode;
  bool finish;

  PushParameter(this.page,
      {this.routeSettings, this.requestCode = 0, this.finish = false});
}
