// Dart imports:
import 'dart:async';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import 'pagination_state.dart';

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginationNotifier({
    required this.fetchNextItems,
    required this.itemsPerBatch,
  }) : super(const PaginationState.loading());

  final Future<Either<NetworkException, List<T>>> Function(int index)
      fetchNextItems;
  final int itemsPerBatch;

  final List<T> _items = [];
  bool _hasEndReached = false;
  ValueNotifier<int> page = ValueNotifier(1);
  Timer _timer = Timer(const Duration(milliseconds: 0), () {});

  void init() {
    if (_items.isEmpty) {
      fetchFirstBatch();
    }
  }

  void updateData(List<T> result) {
    if (result.isEmpty) {
      state = PaginationState.data(_items);
    } else {
      state = PaginationState.data(_items..addAll(result));
    }
  }

  Future<void> fetchFirstBatch() async {
    state = const PaginationState.loading();
    final Either<NetworkException, List<T>> result = _items.isEmpty
        ? await fetchNextItems(page.value)
        : await fetchNextItems(page.value += 1);
    result.fold(
      (failure) => state = PaginationState.error(failure, StackTrace.current),
      (r) => updateData(r),
    );
  }

  Future<void> fetchNextBatch() async {
    if (_timer.isActive || _hasEndReached) {
      log("Rejected");
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});
    if (state == PaginationState.onGoingLoading(_items)) {
      log("Rejected");
      return;
    }
    page.value += 1;
    state = PaginationState.onGoingLoading(_items);

    await Future.delayed(const Duration(seconds: 1));
    final Either<NetworkException, List<T>> result =
        await fetchNextItems(page.value);
    result.fold(
      (failure) => state = PaginationState.onGoingError(
        _items,
        failure,
        StackTrace.current,
      ),
      (r) {
        if (r.isEmpty) {
          _hasEndReached = true;
        }
        updateData(r);
      },
    );
  }
}
