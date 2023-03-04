// Generic AsyncValueWidget to work with values of type T
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseListWidget<T> extends StatelessWidget {
  const BaseListWidget({Key? key, required this.value, required this.data})
      : super(key: key);
  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(
        child: Text(
          e.toString(),
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
