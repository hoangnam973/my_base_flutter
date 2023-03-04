import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_base_flutter/common_widgets/pagination_state/pagination_state.dart';

//https://www.freecodecamp.org/news/infinite-pagination-in-flutter-with-riverpod/

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginationNotifier({
    required this.fetchNextItems,
    required this.itemsPerBatch,
  }) : super(const PaginationState.loading());

  final Future<List<T>> Function(int page) fetchNextItems;
  final int itemsPerBatch;
  int currentPage = 1;

  final List<T> _items = [];

  Timer _timer = Timer(const Duration(milliseconds: 0), () {});

  bool noMoreItems = false;

  void init() {
    if (_items.isEmpty) {
      fetchFirstBatch();
    }
  }

  void updateData(List<T> result) {
    noMoreItems = result.length < itemsPerBatch;

    if (result.isEmpty) {
      state = PaginationState.data(_items);
    } else {
      state = PaginationState.data(_items..addAll(result));
    }
  }

  Future<void> fetchFirstBatch() async {
    try {
      state = const PaginationState.loading();

      _items.clear();
      currentPage = 1;

      final List<T> result = _items.isEmpty
          ? await fetchNextItems(currentPage)
          : await fetchNextItems(currentPage);
      updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  Future<void> fetchNextBatch() async {
    if (_timer.isActive && _items.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});

    if (noMoreItems) {
      return;
    }

    if (state == PaginationState<T>.onGoingLoading(_items)) {
      log("Rejected");
      return;
    }

    log("Fetching next batch of items");

    state = PaginationState.onGoingLoading(_items);

    try {
      await Future.delayed(const Duration(seconds: 1));
      currentPage = currentPage + 1;
      final result = await fetchNextItems(currentPage);
      log(result.length.toString());
      updateData(result);
    } catch (e, stk) {
      log("Error fetching next page", error: e, stackTrace: stk);
      state = PaginationState.onGoingError(_items, e, stk);
    }
  }
}
