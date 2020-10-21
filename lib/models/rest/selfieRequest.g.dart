// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'selfieRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

selfieRequest _$selfieRequestFromJson(Map<String, dynamic> json) {
  return selfieRequest(
    json['file'],
  json['imageType']
 );
}

Map<String, dynamic> _$selfieRequestToJson(selfieRequest instance) => <String, dynamic>{
  'file': instance.file,
  'imageType': instance.imageType,
};
