// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picklist_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PicklistParams _$$_PicklistParamsFromJson(Map<String, dynamic> json) =>
    _$_PicklistParams(
      fulfillmentOrderNumberid: json['fulfillmentOrderNumberid'] as String?,
      id: json['id'] as String?,
      ignorePerPage: json['ignorePerPage'] as bool? ?? false,
      number: json['number'] as String?,
      orderBy: json['orderBy'] as String?,
      page: json['page'] as int? ?? 1,
      perPage: json['perPage'] as int? ?? 10,
      pickerId: json['pickerId'] as String?,
      platformName: json['platformName'] as String?,
      promiseMinFrom: json['promiseMinFrom'] == null
          ? null
          : DateTime.parse(json['promiseMinFrom'] as String),
      promiseMinTo: json['promiseMinTo'] == null
          ? null
          : DateTime.parse(json['promiseMinTo'] as String),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PicklistStatusEnumMap, e))
          .toList(),
      vendor: json['vendor'] as String?,
      warehouseIds: (json['warehouseIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_PicklistParamsToJson(_$_PicklistParams instance) {
  final val = <String, dynamic>{
    'fulfillmentOrderNumberid': instance.fulfillmentOrderNumberid,
    'id': instance.id,
    'ignorePerPage': instance.ignorePerPage,
    'number': instance.number,
    'orderBy': instance.orderBy,
    'page': instance.page,
    'perPage': instance.perPage,
    'pickerId': instance.pickerId,
    'platformName': instance.platformName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('promiseMinFrom', instance.promiseMinFrom?.toIso8601String());
  writeNotNull('promiseMinTo', instance.promiseMinTo?.toIso8601String());
  val['statuses'] =
      instance.statuses?.map((e) => _$PicklistStatusEnumMap[e]).toList();
  val['vendor'] = instance.vendor;
  val['warehouseIds'] = instance.warehouseIds;
  return val;
}

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
