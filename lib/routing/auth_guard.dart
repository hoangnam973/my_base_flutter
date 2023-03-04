import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/routing/app_router.gr.dart';
import 'package:my_base_flutter/services/local_storage/secure_storage_service.dart';

class AuthGuard extends AutoRouteGuard {
  late Ref ref;
  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    String token = await ref.read(secureStorageServiceProvider).getToken();
    if (token.isNotEmpty) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      router.removeLast();
      // we redirect the user to our login page
      router.push(const LoginRoute());
    }
  }
}
