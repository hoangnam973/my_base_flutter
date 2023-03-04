import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_base_flutter/common_widgets/pagination_notifier.dart';
import 'package:my_base_flutter/common_widgets/pagination_state/pagination_state.dart';
import 'package:my_base_flutter/features/home/data/home_repository.dart';
import 'package:my_base_flutter/features/home/domain/picklist.dart';
import 'package:my_base_flutter/features/home/domain/picklist_params.dart';
import 'package:my_base_flutter/utils/enum.dart';

final itemsProvider = StateNotifierProvider<PaginationNotifier<Picklist>,
    PaginationState<Picklist>>((ref) {
  return PaginationNotifier(
    itemsPerBatch: 50,
    fetchNextItems: (currentPage) {
      final listStatues = [PicklistStatus.hold];
      final listWarehouseIds = [
        "",
        "3fa19358-3c1b-497e-9edf-ab4f263c1ecb",
        "ee9aa5dd-daff-4261-bbc2-c54df8ab8385",
        "3cbbff74-8f3a-4549-b48c-435962662c71",
        "763f417d-039c-4b9f-97c4-8628d9d2b48e",
        "1f9bef45-aeb7-4910-a6c8-8655d2b07238",
        "fc9d9a0a-c2e2-4b6c-b853-8e4db8af0ea9",
        "1ccc59db-2459-4c07-91b3-5baf5f23b06d",
        "b3de5c7c-47a6-44ee-920c-576bcd7e83e0",
        "6d9c6c3a-6037-4f46-9e4a-b49556eadf7c",
        "54606c8a-155c-45fc-b6b2-18dc60fccef8",
        "70993047-ca52-496f-9a97-5bcf97eac0c1",
        "49992aad-5108-4c43-ab89-2694c9906b7d",
        "be119f43-a745-4e3a-9e0d-4775a495275b"
      ];

      final params = PicklistParams(
          orderBy: "updated_at desc",
          platformName: "LANDERS",
          vendor: "Landers Superstore",
          statuses: listStatues,
          warehouseIds: listWarehouseIds,
          page: currentPage);

      return ref.read(homeRepositoryProvider).getPicklist(params);
    },
  )..init();
});
