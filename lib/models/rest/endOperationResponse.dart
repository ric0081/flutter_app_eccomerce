import 'package:json_annotation/json_annotation.dart';

class endOperationResponse {
  int code;
  String message;

  endOperationResponse({this.code, this.message});

  endOperationResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}