// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'addFrontRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

addFrontRequest _$OperationRequestFromJson(Map<String, dynamic> json) {
  return addFrontRequest(
      operationId: json['operationId'] as String,
      userName: json['userName'] as String,
      analyzeOcr: json['analyzeOcr'] as String,
      analyzeAnomalies: json['analyzeAnomalies'] as String,
      file: json['file'] as String,
 /*   createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    latestEditDateTime: json['latestEditDateTime'] == null
        ? null
        : DateTime.parse(json['latestEditDateTime'] as String),
  */
 );
}

Map<String, dynamic> _$addFrontToJson(addFrontRequest instance) => <String, dynamic>{
  'operationId': instance.operationId,
  'userName': instance.userName,
  'analyzeOcr': instance.analyzeOcr,
  'analyzeAnomalies': instance.analyzeAnomalies,
  'file': instance.file,

  /* 'createDateTime': instance.createDateTime?.toIso8601String(),
  'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),*/
};
