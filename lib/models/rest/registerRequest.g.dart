// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'registerRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

registerRequest _$registerRequestFromJson(Map<String, dynamic> json) {


  var list = json['selfieList'] as List;
  List<selfieRequest> itemsList = list.map((i) => selfieRequest.fromJson(i)).toList();

  return registerRequest(
      operationId: json['operationId'] as String,
      userName: json['userName'] as String,
    //  selfieLista:json['selfieList'] as List<selfieRequest>,
    selfieLista: itemsList,

 );
}

//Map<String, dynamic> _$registerRequestToJson(registerRequest instance) => <String, dynamic>{
Map<String, dynamic> _$registerRequestToJson(registerRequest instance) =><String, dynamic>{
'operationId': instance.operationId,
  'userName': instance.userName,
 // 'selfieList': instance.selfieLista?.map(_Converter<T>().toJson(object))?.toList()

      'selfieList': instance.selfieLista.map((reminder) => reminder.toJson()).toList(),

//  'selfieList': instance.selfieLista,

  /* 'createDateTime': instance.createDateTime?.toIso8601String(),
  'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),*/
};

