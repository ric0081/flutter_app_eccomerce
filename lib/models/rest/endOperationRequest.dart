import 'package:json_annotation/json_annotation.dart';

class endOperationRequest {
  String operationId;
  String userName;

  endOperationRequest({this.operationId, this.userName});

  endOperationRequest.fromJson(Map<String, dynamic> json) {
    operationId = json['operationId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operationId'] = this.operationId;
    data['userName'] = this.userName;
    return data;
  }
}