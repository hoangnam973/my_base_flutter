import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/common_widgets/loading_button_widget.dart';
import 'package:my_base_flutter/features/login/presentation/login_button_controller.dart';
import 'package:my_base_flutter/hook/use_l10n.dart';
import 'package:my_base_flutter/routing/app_router.gr.dart';
import 'package:my_base_flutter/theme/app_theme.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.signIn,
          style: theme.textTheme.h60.bold().rotunda(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LoadingButtonWidget(
              onPressed: () async {
                final result = await ref
                    .read(loginButtonControllerProvider.notifier)
                    .login("lucky.salamera@snapmart.ph", "oms123");
                if (result) {
                  // context.router.push(const HomeRoute());
                  context.replaceRoute(const HomeRoute());
                }
              },
              controller: loginButtonControllerProvider,
            ),
          ],
        ),
      ),
    );
  }
}
