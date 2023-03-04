import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_base_flutter/app.dart';
import 'package:my_base_flutter/services/local_storage/secure_storage_service.dart';
import 'package:my_base_flutter/services/local_storage/shared_pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debugPaintBaselinesEnabled = true;
  // debugPaintSizeEnabled = true;
  // debugPaintLayerBordersEnabled = true;

  // Firebase
  // await Firebase.initializeApp();
  // // Crashlytics
  // await FirebaseCrashlytics.instance
  //     .setCrashlyticsCollectionEnabled(kDebugMode);
  Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) async {
    // await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    originalOnError(errorDetails);
  };

  // if (kReleaseMode) {
  //   debugPrint = (message, {wrapWidth}) {};
  // }

  runZonedGuarded(() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    const flutterSecureStorage = FlutterSecureStorage();
    runApp(ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(sharedPreferences),
        ),
        secureStorageServiceProvider.overrideWithValue(
          SecureStorageService(flutterSecureStorage),
        ),
      ],
      child: const App(),
    ));
  }, (error, stackTrace) {
    var test = "";
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
