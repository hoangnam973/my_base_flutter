import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_base_flutter/services/local_storage/secure_storage_service.dart';
import 'package:my_base_flutter/services/networking/api_endpoint.dart';
import 'package:my_base_flutter/services/networking/base_dio_method.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepository(ref);
});

class LoginRepository extends BaseDioMethod {
  LoginRepository(super.ref);

  Future<String> login(
      {required String email, required String password}) async {
    final response = await post(
      UserApi.authenticate,
      data: {"email": email, "password": password},
    );
    ref.read(secureStorageServiceProvider).saveToken(response['data']['token']);
    return response['data']['token'];
  }
}
