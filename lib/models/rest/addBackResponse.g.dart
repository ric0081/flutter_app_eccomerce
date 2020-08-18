// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'addBackResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

addBackResponse _$addBackResponseFromJson(Map<String, dynamic> json) {
  return addBackResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    detectedCountry: json['detectedCountry'] as String,
    addBackRequired: json['addBackRequired'] as bool,
    addDocumentPictureRequired: json['addDocumentPictureRequired'] as bool,
    documentPictureDetected: json['documentPictureDetected'] as bool,
    containsBarcode: json['containsBarcode'] as bool,
    barcodeDetected: json['barcodeDetected'] as bool,


 /*   createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    latestEditDateTime: json['latestEditDateTime'] == null
        ? null
        : DateTime.parse(json['latestEditDateTime'] as String),
  */
 );
}

Map<String, dynamic> _$addFrontFromJson(addBackResponse instance) => <String, dynamic>{
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
  'detectedCountry': instance.detectedCountry,
  'addBackRequired': instance.addBackRequired,
  'addDocumentPictureRequired': instance.addDocumentPictureRequired,
  'documentPictureDetected': instance.documentPictureDetected,
  'containsBarcode': instance.containsBarcode,
  'barcodeDetected': instance.barcodeDetected,




  /* 'createDateTime': instance.createDateTime?.toIso8601String(),
  'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),*/
};
