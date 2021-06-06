import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

///订阅字段
///在ValueNotifier的基础上加上了可传空
class ObservableField<T> extends ValueNotifier<T> {
  final bool single;

  ObservableField({T value, this.single: false}) : super(value);

  @override
  void addListener(listener) {
    if(hasListeners&&single){
      return;
    }
    super.addListener(listener);
  }
}

class ObservableInt extends ValueNotifier<int> {
  ObservableInt({int value = 0}) : super(value);
}

class ObservableDouble extends ValueNotifier<double> {
  ObservableDouble({double value = 0}) : super(value);
}

class ObservableBool extends ValueNotifier<bool> {
  ObservableBool({bool value = false}) : super(value);
}
