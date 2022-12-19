part of '../prime_screen.dart';

mixin _KeyValueMixin {
  final Map _map = {};

  T getValue<T>(String? key, T value) {
    final stored = _map['$key + $T'];
    if (stored != null) {
      return stored;
    } else {
      setValue<T>(key, value);
      final stored = _map['$key + $T'];
      return stored;
    }
  }

  void setValue<T>(String? key, T value) {
    _map['$key + $T'] = value;
  }

  List<T> all<T>() {
    return _map.keys.expand((key) {
      final value = _map[key];
      if (value is T) {
        return <T>[value];
      } else {
        return <T>[];
      }
    }).toList();
  }
}
