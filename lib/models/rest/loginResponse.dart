import 'package:json_annotation/json_annotation.dart';

class loginResponse {
  int code;
  String message;
  double confidence;
  bool identical;

  loginResponse({this.code, this.message, this.confidence, this.identical});

  loginResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    confidence = json['confidence'];
    identical = json['identical'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['confidence'] = this.confidence;
    data['identical'] = this.identical;
    return data;
  }
}