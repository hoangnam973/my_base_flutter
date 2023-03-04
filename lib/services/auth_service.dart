import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/services/local_storage/secure_storage_service.dart';

final authProvider = StateNotifierProvider<AuthService, bool>((ref) {
  return AuthService(ref);
});

class AuthService extends StateNotifier<bool> {
  AuthService(this.ref) : super(false);

  final Ref ref;

  void isAuthenticated() async {
    final repository = ref.read(secureStorageServiceProvider);
    String token = await repository.getToken();
    if (token.isEmpty) {
      state = false;
    } else {
      state = true;
    }
  }
}

// final authProvider = Provider<bool>((ref) {
//   final repository = ref.read(sharedPreferencesServiceProvider);
//   if (repository.getToken().isEmpty) {
//     return false;
//   } else {
//     return true;
//   }
// });
