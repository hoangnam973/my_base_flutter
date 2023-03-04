import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/features/home/presentation/picklist_paginate_provider.dart';
import 'package:my_base_flutter/features/home/presentation/widgets/info_user_widget.dart';
import 'package:my_base_flutter/features/home/presentation/widgets/picklist_widget.dart';
import 'package:my_base_flutter/hook/use_l10n.dart';
import 'package:my_base_flutter/routing/app_router.gr.dart';
import 'package:my_base_flutter/services/local_storage/secure_storage_service.dart';
import 'package:my_base_flutter/theme/app_theme.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.detail,
          style: theme.textTheme.h60.bold().rotunda(),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // final stateThemeProvider =
                  //     ref.read(sharedPreferencesServiceProvider);
                  // final stateTheme = stateThemeProvider.getStateTheme();
                  // stateThemeProvider.saveStateTheme(!stateTheme);
                  // ref.refresh(appThemeModeProvider);

                  ref.read(secureStorageServiceProvider).clearToken();
                  context.replaceRoute(const LoginRoute());
                },
                child: const Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const InfoUserWidget(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: PicklistWidget(
              onRefresh: () {
                ref.read(itemsProvider.notifier).fetchFirstBatch();
              },
              onLoadMore: () {
                ref.read(itemsProvider.notifier).fetchNextBatch();
              },
            ))
          ],
        ),
      ),
    );
  }
}
