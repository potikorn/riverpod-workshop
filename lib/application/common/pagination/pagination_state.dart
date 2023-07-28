import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_guide/application/config/network/error_exception.dart';

part 'pagination_state.freezed.dart';

@freezed
abstract class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.data(List<T> items) = _Data;
  const factory PaginationState.loading() = _Loading;
  const factory PaginationState.error(NetworkException exception,
      [StackTrace? stacktrace]) = _Error;
  const factory PaginationState.onGoingLoading(List<T> items) = _OnGoingLoading;
  const factory PaginationState.onGoingError(
          List<T> items, NetworkException exception, [StackTrace? stacktrace]) =
      _OnGoingError;
}
