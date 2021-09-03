import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

///订阅字段
///在ValueNotifier的基础上加上了可传空
class ObservableField<T> extends ChangeNotifier implements Listenable {
  final bool single;
  T? _value;

  ObservableField({T? value, this.single: false});

  T? get value => _value;

  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  void setValueAndNotify(T? value) {
    if (this.value == value) {
      notifyListeners();
    } else {
      this.value = value;
    }
  }

  @override
  void addListener(listener) {
    if (hasListeners && single) {
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
