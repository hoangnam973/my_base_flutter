import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_base_flutter/utils/enum.dart';

part 'picklist_params.freezed.dart';
part 'picklist_params.g.dart';

@freezed
class PicklistParams with _$PicklistParams {
  const factory PicklistParams({
    String? fulfillmentOrderNumberid,
    String? id,
    @Default(false) bool ignorePerPage,
    String? number,
    String? orderBy,
    @Default(1) int page,
    @Default(10) int perPage,
    String? pickerId,
    String? platformName,
    @JsonKey(includeIfNull: false) DateTime? promiseMinFrom,
    @JsonKey(includeIfNull: false) DateTime? promiseMinTo,
    List<PicklistStatus>? statuses,
    String? vendor,
    List<String>? warehouseIds,
  }) = _PicklistParams;

  factory PicklistParams.fromJson(Map<String, dynamic> json) =>
      _$PicklistParamsFromJson(json);
}
