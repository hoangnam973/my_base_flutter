import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/app_provider.dart';
import 'package:my_base_flutter/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    // final appRouter = useMemoized(() => AppRouter(authGuard: AuthGuard(ref)));
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme.data,
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
