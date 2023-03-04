import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/features/home/presentation/home_controller.dart';

class InfoUserWidget extends HookConsumerWidget {
  const InfoUserWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _infoUser = ref.watch(infoUserProvider);
    return _infoUser.when(
        data: (data) => Text(data.email),
        error: (e, s) => Text(e.toString()),
        loading: () => const CircularProgressIndicator());
  }
}
