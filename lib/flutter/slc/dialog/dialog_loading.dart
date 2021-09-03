import 'package:flutter/material.dart';
import '../code/observable_field.dart';

///加载对话框
class LoadingDialog extends Dialog {
  final String? text;

  LoadingDialog({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return new Material(
      type: MaterialType.transparency,
      child: new Center(
        child: new SizedBox(
          width: 120.0,
          height: 120.0,
          child: new Container(
            decoration: BoxDecoration(
              color: themeData.dialogBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Padding(
                    padding: EdgeInsets.only(
                      top: text == null ? 16 : 0,
                    ),
                    child: text == null
                        ? null
                        : new Text(text!,
                        style: themeData.dialogTheme.titleTextStyle)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///显示对话框
  static void showLoadingDialog(BuildContext context,
      {bool barrierDismissible = false, String? title}) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return LoadingDialog(text: title);
        });
  }

  ///关闭对话框
  static void dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}

///loading dialog的控件
///使用混入引用
abstract class LoadingDialogWidget {
  factory LoadingDialogWidget._() => throw "cannot instantiate";

  void registerDialogEvent(
      BuildContext context, LoadingDialogVm loadingDialogVm) {
    loadingDialogVm.showLoadingOf.addListener(() {
      showLoadingDialog(context, title: loadingDialogVm.showLoadingOf.value);
    });
    loadingDialogVm.dismissLoadingOf.addListener(() {
      dismissLoadingDialog(context);
    });
  }

  ///显示对话框
  void showLoadingDialog(BuildContext context,
      {bool barrierDismissible = false, String? title}) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return LoadingDialog(text: title);
        });
  }

  ///关闭对话框
  void dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}

///loading dialog的VM
///使用混入引用
abstract class LoadingDialogVm {
  factory LoadingDialogVm._() => throw "cannot instantiate";
  final ObservableField<String> showLoadingOf = ObservableField(single: true);
  final ObservableField<String> dismissLoadingOf =
  ObservableField(single: true);

  showLoading({String? title}) {
    showLoadingOf.setValueAndNotify(title);
  }

  dismissLoading() {
    dismissLoadingOf.notifyListeners();
  }
}
