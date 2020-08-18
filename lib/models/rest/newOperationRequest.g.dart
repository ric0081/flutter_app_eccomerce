// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'newOperationRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

newOperationRequest _$OperationRequestFromJson(Map<String, dynamic> json) {
  return newOperationRequest(
    userName: json['userName'] as String,
    ipAddress: json['ipAddress'] as String,
    deviceHash: json['deviceHash'] as String,
    rooted: json['rooted'] as bool,
    applicationVersion: json['applicationVersion'] as String,
    operativeSystemVersion: json['operativeSystemVersion'] as String,
    operationSystem: json['operationSystem'] as String,
    deviceManufacture: json['deviceManufacture'] as String,
    dataAgreement: json['dataAgreement'] as bool
 /*   createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    latestEditDateTime: json['latestEditDateTime'] == null
        ? null
        : DateTime.parse(json['latestEditDateTime'] as String),
  */
 );
}

Map<String, dynamic> _$OperationRequestToJson(newOperationRequest instance) => <String, dynamic>{
  'userName': instance.userName,
  'ipAddress': instance.ipAddress,
  'deviceHash': instance.deviceHash,
  'rooted': instance.rooted,
  'applicationVersion': instance.applicationVersion,
  'operativeSystemVersion': instance.operativeSystemVersion,
  'operationSystem': instance.operationSystem,
  'deviceManufacture': instance.deviceManufacture,
  'dataAgreement': instance.dataAgreement,
 /* 'createDateTime': instance.createDateTime?.toIso8601String(),
  'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),*/
};
