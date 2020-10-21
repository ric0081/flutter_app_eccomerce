// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'registerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

registerResponse _$registerResponseFromJson(Map<String, dynamic> json) {
  return registerResponse(
    code: json['code'] as int,
    message: json['message'] as String,
 /*   createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    latestEditDateTime: json['latestEditDateTime'] == null
        ? null
        : DateTime.parse(json['latestEditDateTime'] as String),
  */
 );
}

Map<String, dynamic> _$registerFromJson(registerResponse instance) => <String, dynamic>{
  /*"code": 909,
    "message": "Add front success",
    "detectedCountry": "ecuador",
    "addBackRequired": true,
    "addDocumentPictureRequired": true,
    "documentPictureDetected": false,
    "containsBarcode": true,
    "barcodeDetected": false
  */

  'code': instance.code,
  'message': instance.message,

  /* 'createDateTime': instance.createDateTime?.toIso8601String(),
  'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),*/
};
