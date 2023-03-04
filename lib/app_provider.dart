import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/routing/app_router.gr.dart';
import 'package:my_base_flutter/routing/auth_guard.dart';

final appRouterProvider =
    Provider((ref) => AppRouter(authGuard: AuthGuard(ref)));
