// Package imports:
import 'package:mocktail/mocktail.dart';

class MockListener<T> extends Mock {
  void call(T? previous, T value);
}
