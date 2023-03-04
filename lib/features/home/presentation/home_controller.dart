import 'package:my_base_flutter/features/home/data/home_repository.dart';
import 'package:my_base_flutter/features/home/domain/picklist.dart';
import 'package:my_base_flutter/features/home/domain/picklist_params.dart';
import 'package:my_base_flutter/features/home/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

// final homeControllerProvider =
//     ChangeNotifierProvider((ref) => HomeController(ref));

@riverpod
Future<User> infoUser(InfoUserRef ref) async {
  return await ref.watch(homeRepositoryProvider).getUser();
}

@riverpod
Future<List<Picklist>> picklist(PicklistRef ref,
    {required PicklistParams picklistParams}) async {
  return await ref.watch(homeRepositoryProvider).getPicklist(picklistParams);
}

// final infoUserProvider = FutureProvider.autoDispose<User>((ref) async {
//   return await ref.read(homeRepositoryProvider).getUser();
// });

// final picklistProvider =
//     FutureProvider.family<List<Picklist>, PicklistParams>((ref, params) async {
//   return await ref.read(homeRepositoryProvider).getPicklist(params);
// });

// final productProvider =
//     StreamProvider.autoDispose.family<Product, String>((ref, id) {
//   // dataStore is an API we can use to access our DB
//   final dataStore = ref.watch(dataStoreProvider);
//   // return a stream with the given product ID
//   return dataStore.product(id);
// });

// class HomeController extends ChangeNotifier {
//   HomeController(this.ref);

//   final Ref ref;

//   Future<User> getUser() async {
//     return await ref.read(homeRepositoryProvider).getUser();
//   }

//   Future<List<Picklist>> getPicklist(PicklistParams params) async {
//     return await ref.read(homeRepositoryProvider).getPicklist(params);
//   }
// }
