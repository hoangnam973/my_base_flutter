import 'package:my_base_flutter/features/home/domain/picklist_params.dart';
import 'package:my_base_flutter/features/home/domain/picklist.dart';
import 'package:my_base_flutter/features/home/domain/user.dart';
import 'package:my_base_flutter/services/networking/api_endpoint.dart';
import 'package:my_base_flutter/services/networking/base_dio_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

// final homeRepositoryProvider = Provider<HomeRepository>((ref) {
//   return HomeRepository(ref);
// });

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(ref);
}

class HomeRepository extends BaseDioMethod {
  HomeRepository(super.ref);

  Future<User> getUser() async {
    final response = await get(UserApi.me);
    return User.fromJson(response["data"]);
  }

  Future<List<Picklist>> getPicklist(PicklistParams params) async {
    final response =
        await get(PicklistApi.picklists, queryParameters: params.toJson());
    final list = List<Picklist>.from(
        response["data"].map((item) => Picklist.fromJson(item))).toList();
    return list;
  }
}
