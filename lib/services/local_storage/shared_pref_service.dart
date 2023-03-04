import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const stateTheme = 'state_theme';

  Future<void> saveStateTheme(bool value) async {
    await sharedPreferences.setBool(stateTheme, value);
  }

  bool getStateTheme() {
    return sharedPreferences.getBool(stateTheme) ?? false;
  }
}
