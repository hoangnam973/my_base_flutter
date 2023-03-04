import 'package:auto_route/auto_route.dart';
import 'package:my_base_flutter/features/home/presentation/home_screen.dart';
import 'package:my_base_flutter/features/login/presentation/login_screen.dart';
import 'package:my_base_flutter/routing/auth_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/login', page: LoginScreen),
    AutoRoute(
        path: '/home', page: HomeScreen, guards: [AuthGuard], initial: true),
  ],
)
// extend the generated private router
class $AppRouter {}
