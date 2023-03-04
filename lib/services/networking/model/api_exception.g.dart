// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiException _$$_ApiExceptionFromJson(Map<String, dynamic> json) =>
    _$_ApiException(
      message: json['message'] as String,
      code: json['code'] as int?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$$_ApiExceptionToJson(_$_ApiException instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'statusCode': instance.statusCode,
    };
