import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final secureStorageServiceProvider =
    Provider<SecureStorageService>((ref) => throw UnimplementedError());

class SecureStorageService {
  SecureStorageService(this.flutterSecureStorage);
  final FlutterSecureStorage flutterSecureStorage;

  static const token = 'token';
  static const stateTheme = 'state_theme';

  Future<void> clearToken() async {
    await flutterSecureStorage.delete(key: token);
  }

  // String getToken() => flutterSecureStorage.read(key: token).toString();

  Future<String> getToken() async {
    return await flutterSecureStorage.read(key: token) ?? "";
  }

  Future<void> saveToken(String value) async {
    await flutterSecureStorage.write(key: token, value: value);
  }
}
