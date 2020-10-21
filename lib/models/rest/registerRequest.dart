import 'package:flutter_app_eccomerce/models/rest/selfieRequest.dart';
import 'package:json_annotation/json_annotation.dart';

import 'selfieRequest.dart';

part 'registerRequest.g.dart';

@JsonSerializable()
class registerRequest{

  @JsonKey(name: 'operationId')
  String operationId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'selfieList')
  List<selfieRequest> selfieLista;

  registerRequest({
    this.operationId,
    this.userName,
    this.selfieLista,
  });

  factory registerRequest.fromJson(Map<String, dynamic> srcJson) => _$registerRequestFromJson(srcJson);
  Map<String, dynamic> toJson() => _$registerRequestToJson(this);




  //List<selfieList> selfieLista;
/*
  registerRequest(
    this.operationId,
    this.userName,
    [this.selfieLista]
    );

      factory registerRequest.fromJson(dynamic json) {
      if (json['tags'] != null) {
      var tagObjsJson = json['selfieList'] as List;
      List<selfieRequest> _tags = tagObjsJson.map((tagJson) => selfieRequest.fromJson(tagJson)).toList();
            return registerRequest(
          json['operationId'] as String,
          json['username'] as String,
          _tags
          );
      } else {
      return registerRequest(
          json['title'] as String,
          json['description'] as String,
          );
      }
      }


*//*/
  @override
  String toString() {
    return '{ ${this.operationId}, ${this.userName}, ${this.selfieLista} }';
  }*/
//    factory newOperationRequest.fromJson(Map<String, dynamic> item) => _$NoteFromJson(item);

  /*newOperationRequest(
      {
        @required this.noteTitle,
        @required this.noteContent,
      }
      );
*/
  //Map<String, dynamic> toJson() =>_$addBackToJson(this);
 }