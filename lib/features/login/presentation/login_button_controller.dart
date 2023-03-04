import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/features/login/data/login_repository.dart';

final loginButtonControllerProvider =
    StateNotifierProvider<LoginButtonController, AsyncValue<void>>((ref) {
  return LoginButtonController(ref);
});

class LoginButtonController extends StateNotifier<AsyncValue<void>> {
  LoginButtonController(this.ref)
      // initialize state
      : super(const AsyncValue.data(null));
  final Ref ref;

  Future<bool> login(String username, String password) async {
    // try {
    //   // set state to `loading` before starting the asynchronous work
    //   state = const AsyncValue.loading();
    //   // do the async work
    //   await ref
    //       .watch(userControllerProvider)
    //       .getToken(email: username, password: password);
    //   // .getToken(email: "asdasdfsdfsdfds", password: "oms1234");
    //   // await ref
    //   //     .read(loginServiceProvider)
    //   //     .login(email: "lucky.salamera@snapmart.ph", password: "oms1234");
    //   return true;
    // } catch (e) {
    //   // if the payment failed, set the error state
    //   state = AsyncValue.error(e);
    // } finally {
    //   // set state to `data(null)` at the end (both for success and failure)
    //   state = const AsyncValue.data(null);
    // }
    // return false;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
        .watch(loginRepositoryProvider)
        .login(email: username, password: password));
    return state is! AsyncError;
  }
}
