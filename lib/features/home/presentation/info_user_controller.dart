// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:my_base_flutter/features/home/application/home_service_impl.dart';
// import 'package:my_base_flutter/features/home/domain/user.dart';

// final infoUserControllerProvider =
//     StateNotifierProvider<InfoUserController, AsyncValue<User>>((ref) {
//   return InfoUserController(ref);
// });

// class InfoUserController extends StateNotifier<AsyncValue<User>> {
//   InfoUserController(this.ref)
//       // initialize state
//       : super(const AsyncValue.data(null));
//   final Ref ref;

//   Future<void> getInfoUser() async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() {
//       return ref.read(homeServiceProvider).getUser();
//     });
//   }
// }
