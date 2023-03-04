import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/utils/extensions/async_value_ui.dart';

class LoadingButtonWidget extends HookConsumerWidget {
  final Function onPressed;
  final StateNotifierProvider<dynamic, AsyncValue<void>> controller;

  const LoadingButtonWidget(
      {Key? key, required this.onPressed, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. listen for errors
    ref.listen<AsyncValue<void>>(
      controller,
      (_, state) => state.showSnackBarOnError(context),
    );
    // 2. use the loading state in the child widget
    final loginState = ref.watch(controller);
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: loginState.isLoading
          ? const CircularProgressIndicator()
          : const Text("Login now ..."),
    );
  }
}

// class LoadingButtonWidget extends StatelessWidget {
//   final Function onPressed;
//   final WidgetRef ref;
//   final StateNotifierProvider<dynamic, AsyncValue<void>> controller;

//   const LoadingButtonWidget(
//       {Key? key,
//       required this.onPressed,
//       required this.ref,
//       required this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // 1. listen for errors
//     ref.listen<AsyncValue<void>>(
//       controller,
//       (_, state) => state.showSnackBarOnError(context),
//     );
//     // 2. use the loading state in the child widget
//     final loginState = ref.watch(controller);
//     return ElevatedButton(
//       onPressed: () {
//         onPressed();
//       },
//       child: loginState.isLoading
//           ? const CircularProgressIndicator()
//           : const Text("Login"),
//     );
//   }
// }
