import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_base_flutter/utils/enum.dart';

part 'picklist.freezed.dart';
part 'picklist.g.dart';

@freezed
class Picklist with _$Picklist {
  const factory Picklist({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? platformName,
    String? number,
    String? fulfillmentOrderId,
    String? fulfillmentOrderNumber,
    PicklistStatus? status,
    DateTime? promiseMinTime,
    DateTime? promiseMaxTime,
    String? pickerId,
    String? receiverAddressId,
    String? posTransactionNumber,
    String? posReceiptNumber,
    String? shippingProviderId,
    String? sortCode,
    String? warehouseId,
    int? totalSku,
    int? totalItem,
    List<String>? tags,
    DateTime? earliestTimeToPick,
    DateTime? earliestTimeToShip,
    DateTime? latestTimeToPick,
    String? trackingNumber,
    String? routeNumber,
    String? city,
    int? totalCheckoutSku,
    int? totalCheckoutItem,
    String? packerId,
    bool? isManualInput,
    String? vendor,

    // manual assign
    String? warehouseCode,
    String? warehouseAlias,
    String? cancellationOption,
  }) = _Picklist;

  factory Picklist.fromJson(Map<String, dynamic> json) =>
      _$PicklistFromJson(json);
}
