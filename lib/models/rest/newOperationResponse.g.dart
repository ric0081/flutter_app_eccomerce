// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'newOperationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
newOperationResponse _$NoteFromJson(Map<String, dynamic> json) {
  return newOperationResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    operationId: json['operationId'] as int,
 /*   createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    latestEditDateTime: json['latestEditDateTime'] == null
        ? null
        : DateTime.parse(json['latestEditDateTime'] as String),
  */
 );
}

Map<String, dynamic> _$NoteToJson(newOperationResponse instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'operationId': instance.operationId,
 /* 'createDateTime': instance.createDateTime?.toIso8601String(),
  'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),*/
};
