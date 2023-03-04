// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Picklist _$$_PicklistFromJson(Map<String, dynamic> json) => _$_Picklist(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      platformName: json['platformName'] as String?,
      number: json['number'] as String?,
      fulfillmentOrderId: json['fulfillmentOrderId'] as String?,
      fulfillmentOrderNumber: json['fulfillmentOrderNumber'] as String?,
      status: $enumDecodeNullable(_$PicklistStatusEnumMap, json['status']),
      promiseMinTime: json['promiseMinTime'] == null
          ? null
          : DateTime.parse(json['promiseMinTime'] as String),
      promiseMaxTime: json['promiseMaxTime'] == null
          ? null
          : DateTime.parse(json['promiseMaxTime'] as String),
      pickerId: json['pickerId'] as String?,
      receiverAddressId: json['receiverAddressId'] as String?,
      posTransactionNumber: json['posTransactionNumber'] as String?,
      posReceiptNumber: json['posReceiptNumber'] as String?,
      shippingProviderId: json['shippingProviderId'] as String?,
      sortCode: json['sortCode'] as String?,
      warehouseId: json['warehouseId'] as String?,
      totalSku: json['totalSku'] as int?,
      totalItem: json['totalItem'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      earliestTimeToPick: json['earliestTimeToPick'] == null
          ? null
          : DateTime.parse(json['earliestTimeToPick'] as String),
      earliestTimeToShip: json['earliestTimeToShip'] == null
          ? null
          : DateTime.parse(json['earliestTimeToShip'] as String),
      latestTimeToPick: json['latestTimeToPick'] == null
          ? null
          : DateTime.parse(json['latestTimeToPick'] as String),
      trackingNumber: json['trackingNumber'] as String?,
      routeNumber: json['routeNumber'] as String?,
      city: json['city'] as String?,
      totalCheckoutSku: json['totalCheckoutSku'] as int?,
      totalCheckoutItem: json['totalCheckoutItem'] as int?,
      packerId: json['packerId'] as String?,
      isManualInput: json['isManualInput'] as bool?,
      vendor: json['vendor'] as String?,
      warehouseCode: json['warehouseCode'] as String?,
      warehouseAlias: json['warehouseAlias'] as String?,
      cancellationOption: json['cancellationOption'] as String?,
    );

Map<String, dynamic> _$$_PicklistToJson(_$_Picklist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'platformName': instance.platformName,
      'number': instance.number,
      'fulfillmentOrderId': instance.fulfillmentOrderId,
      'fulfillmentOrderNumber': instance.fulfillmentOrderNumber,
      'status': _$PicklistStatusEnumMap[instance.status],
      'promiseMinTime': instance.promiseMinTime?.toIso8601String(),
      'promiseMaxTime': instance.promiseMaxTime?.toIso8601String(),
      'pickerId': instance.pickerId,
      'receiverAddressId': instance.receiverAddressId,
      'posTransactionNumber': instance.posTransactionNumber,
      'posReceiptNumber': instance.posReceiptNumber,
      'shippingProviderId': instance.shippingProviderId,
      'sortCode': instance.sortCode,
      'warehouseId': instance.warehouseId,
      'totalSku': instance.totalSku,
      'totalItem': instance.totalItem,
      'tags': instance.tags,
      'earliestTimeToPick': instance.earliestTimeToPick?.toIso8601String(),
      'earliestTimeToShip': instance.earliestTimeToShip?.toIso8601String(),
      'latestTimeToPick': instance.latestTimeToPick?.toIso8601String(),
      'trackingNumber': instance.trackingNumber,
      'routeNumber': instance.routeNumber,
      'city': instance.city,
      'totalCheckoutSku': instance.totalCheckoutSku,
      'totalCheckoutItem': instance.totalCheckoutItem,
      'packerId': instance.packerId,
      'isManualInput': instance.isManualInput,
      'vendor': instance.vendor,
      'warehouseCode': instance.warehouseCode,
      'warehouseAlias': instance.warehouseAlias,
      'cancellationOption': instance.cancellationOption,
    };

const _$PicklistStatusEnumMap = {
  PicklistStatus.created: 'created',
  PicklistStatus.paused: 'paused',
  PicklistStatus.picking: 'picking',
  PicklistStatus.hold: 'hold',
  PicklistStatus.cancelled: 'cancelled',
  PicklistStatus.picked: 'picked',
  PicklistStatus.packed: 'packed',
  PicklistStatus.accepted: 'accepted',
  PicklistStatus.resolved: 'resolved',
};
