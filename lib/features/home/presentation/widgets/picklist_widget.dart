import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_base_flutter/features/home/domain/picklist.dart';
import 'package:my_base_flutter/features/home/presentation/picklist_paginate_provider.dart';

// class PicklistWidget extends ConsumerWidget {
//   const PicklistWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final listStatues = [PicklistStatus.hold];
//     final listWarehouseIds = [
//       "",
//       "3fa19358-3c1b-497e-9edf-ab4f263c1ecb",
//       "ee9aa5dd-daff-4261-bbc2-c54df8ab8385",
//       "3cbbff74-8f3a-4549-b48c-435962662c71",
//       "763f417d-039c-4b9f-97c4-8628d9d2b48e",
//       "1f9bef45-aeb7-4910-a6c8-8655d2b07238",
//       "fc9d9a0a-c2e2-4b6c-b853-8e4db8af0ea9",
//       "1ccc59db-2459-4c07-91b3-5baf5f23b06d",
//       "b3de5c7c-47a6-44ee-920c-576bcd7e83e0",
//       "6d9c6c3a-6037-4f46-9e4a-b49556eadf7c",
//       "54606c8a-155c-45fc-b6b2-18dc60fccef8",
//       "70993047-ca52-496f-9a97-5bcf97eac0c1",
//       "49992aad-5108-4c43-ab89-2694c9906b7d",
//       "be119f43-a745-4e3a-9e0d-4775a495275b"
//     ];
//     final params = PicklistParams(
//         orderBy: "updated_at desc",
//         platformName: "LANDERS",
//         vendor: "Landers Superstore",
//         statuses: listStatues,
//         warehouseIds: listWarehouseIds);
//     final picklistAsyncValue =
//         ref.watch(homeControllerProvider).getPicklist(params);
//     return BaseListWidget<Picklist>(
//       value: picklistAsyncValue,
//       data: (product) => ProductScreenContents(product: product),
//     );
//   }
// }

// class PicklistWidget extends ConsumerWidget {
//   PicklistWidget({Key? key}) : super(key: key);

//   // Future<void> _refresh() async {
//   //   print("Refesh data ....");
//   // }

//   final ScrollController scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final listStatues = [PicklistStatus.hold];
//     final listWarehouseIds = [
//       "",
//       "3fa19358-3c1b-497e-9edf-ab4f263c1ecb",
//       "ee9aa5dd-daff-4261-bbc2-c54df8ab8385",
//       "3cbbff74-8f3a-4549-b48c-435962662c71",
//       "763f417d-039c-4b9f-97c4-8628d9d2b48e",
//       "1f9bef45-aeb7-4910-a6c8-8655d2b07238",
//       "fc9d9a0a-c2e2-4b6c-b853-8e4db8af0ea9",
//       "1ccc59db-2459-4c07-91b3-5baf5f23b06d",
//       "b3de5c7c-47a6-44ee-920c-576bcd7e83e0",
//       "6d9c6c3a-6037-4f46-9e4a-b49556eadf7c",
//       "54606c8a-155c-45fc-b6b2-18dc60fccef8",
//       "70993047-ca52-496f-9a97-5bcf97eac0c1",
//       "49992aad-5108-4c43-ab89-2694c9906b7d",
//       "be119f43-a745-4e3a-9e0d-4775a495275b"
//     ];

//     scrollController.addListener(() {
//       double maxScroll = scrollController.position.maxScrollExtent;
//       double currentScroll = scrollController.position.pixels;
//       double delta = MediaQuery.of(context).size.width * 0.20;
//       if (maxScroll - currentScroll <= delta) {
//         print("next page ....");
//       }
//     });

//     final params = PicklistParams(
//         orderBy: "updated_at desc",
//         platformName: "LANDERS",
//         vendor: "Landers Superstore",
//         statuses: listStatues,
//         warehouseIds: listWarehouseIds,
//         page: 1);
//     final picklistAsyncValue = ref.watch(picklistProvider(params));
//     // return BaseListWidget<List<Picklist>>(
//     //     value: picklistAsyncValue,
//     //     data: (products) => CustomScrollView(
//     //           slivers: [
//     //             SliverList(
//     //               delegate: SliverChildBuilderDelegate(
//     //                 (context, index) {
//     //                   final product = products[index];
//     //                   return PicklistItem(product);
//     //                 },
//     //                 childCount: products.length,
//     //               ),
//     //             ),
//     //           ],
//     //         ));

//     return BaseListWidget<List<Picklist>>(
//         value: picklistAsyncValue,
//         data: (products) => CustomScrollView(
//               controller: scrollController,
//               physics: const BouncingScrollPhysics(),
//               slivers: [
//                 CupertinoSliverRefreshControl(
//                   onRefresh: () async {
//                     ref.refresh(picklistProvider(params));
//                   },
//                 ),
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     (context, index) {
//                       final product = products[index];
//                       return PicklistItem(product);
//                     },
//                     childCount: products.length,
//                   ),
//                 ),
//               ],
//             ));
//   }
// }

// class PicklistItem extends ConsumerWidget {
//   final Picklist item;

//   const PicklistItem(this.item, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//         padding: const EdgeInsets.all(5), child: Text(item.number.toString()));
//   }
// }

class PicklistWidget extends ConsumerWidget {
  PicklistWidget({Key? key, required this.onLoadMore, required this.onRefresh})
      : super(key: key);

  final ScrollController scrollController = ScrollController();
  final Function onLoadMore;
  final Function onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.20;
      if (maxScroll - currentScroll <= delta) {
        // ref.read(itemsProvider.notifier).fetchNextBatch();
        onLoadMore();
      }
    });
    return Scaffold(
      floatingActionButton: ScrollToTopButton(
        scrollController: scrollController,
      ),
      body: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        restorationId: "items List",
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              // ref.read(itemsProvider.notifier).fetchFirstBatch();
              onRefresh();
            },
          ),
          const ItemsList(),
          const NoMoreItems(),
          const OnGoingBottomWidget(),
        ],
      ),
    );
  }
}

class ScrollToTopButton extends StatelessWidget {
  const ScrollToTopButton({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        double scrollOffset = scrollController.offset;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: scrollOffset > MediaQuery.of(context).size.height * 0.5
              ? FloatingActionButton(
                  tooltip: "Scroll to top",
                  child: const Icon(
                    Icons.arrow_upward,
                  ),
                  onPressed: () async {
                    scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}

class NoMoreItems extends ConsumerWidget {
  const NoMoreItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(itemsProvider);

    return SliverToBoxAdapter(
      child: state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          data: (items) {
            final nomoreItems = ref.read(itemsProvider.notifier).noMoreItems;
            return nomoreItems
                ? const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "No More Items Found!",
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}

class ItemsList extends StatelessWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(itemsProvider);
      return state.when(
        data: (items) {
          return items.isEmpty
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(itemsProvider.notifier).fetchFirstBatch();
                        },
                        icon: const Icon(Icons.replay),
                      ),
                      const Chip(
                        label: Text("No items Found!"),
                      ),
                    ],
                  ),
                )
              : ItemsListBuilder(
                  items: items,
                );
        },
        loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator())),
        error: (e, stk) => SliverToBoxAdapter(
          child: Center(
            child: Column(
              children: const [
                Icon(Icons.info),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Something Went Wrong!",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        onGoingLoading: (items) {
          return ItemsListBuilder(
            items: items,
          );
        },
        onGoingError: (items, e, stk) {
          return ItemsListBuilder(
            items: items,
          );
        },
      );
    });
  }
}

class ItemsListBuilder extends StatelessWidget {
  const ItemsListBuilder({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Picklist> items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            title: Text(items[index].number.toString()),
          );
        },
        childCount: items.length,
      ),
    );
  }
}

class OnGoingBottomWidget extends StatelessWidget {
  const OnGoingBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(40),
      sliver: SliverToBoxAdapter(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(itemsProvider);
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            onGoingLoading: (items) =>
                const Center(child: CircularProgressIndicator()),
            onGoingError: (items, e, stk) => Center(
              child: Center(
                child: Column(
                  children: const [
                    Icon(Icons.info),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Something Went Wrong!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
