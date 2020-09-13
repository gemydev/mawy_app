import 'package:meta/meta.dart';

class Preference<T> {
  final String key;
  T value;
  final T initValue;

  Preference({
    @required this.key,
    this.value,
    @required this.initValue,
  });

  @override
  String toString() {
    return 'Preference{key: $key, value: $value, initValue: $initValue}';
  }

  Type typeOfPreference() => T;
}
