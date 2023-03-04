import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/services/networking/model/api_exception.dart';

extension AsyncValueUI on AsyncValue<void> {
  // isLoading shorthand (AsyncLoading is a subclass of AsycValue)
  bool get isLoading => this is AsyncLoading<void>;

  // show a snackbar on error only
  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text((error as ApiException).message)),
          );
        },
      );
}
