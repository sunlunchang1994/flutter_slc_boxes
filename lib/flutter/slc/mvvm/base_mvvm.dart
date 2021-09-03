import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///基于mvvm架构的的基础界面和BaseVm
abstract class MvvmStatelessWidget<T extends BaseVm> extends StatelessWidget {
  MvvmStatelessWidget({Key? key}) : super(key: key);

  ///注册事件
  void registerEvent(BuildContext context) {
    T baseVm = Provider.of<T>(context, listen: false);
    registerEventByVm(context, baseVm);
  }

  ///注册事件
  void registerEventByVm(BuildContext context, T vm) {}
}

abstract class MvvmState<W extends StatefulWidget, T extends BaseVm>
    extends State<W> {
  MvvmState();

  ///注册事件
  void registerEvent(BuildContext context) {
    T baseVm = Provider.of<T>(context, listen: false);
    registerEventByVm(context, baseVm);
  }

  ///注册事件
  void registerEventByVm(BuildContext context, T vm) {}
}

///基于mvvm架构的viewModel
class BaseVm extends ChangeNotifier {
  bool disposed = false;

  BaseVm();

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}

@deprecated
enum ViewState { Idle, Busy }
