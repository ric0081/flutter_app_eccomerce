import 'package:json_annotation/json_annotation.dart';

class loginResponse{
  String code;
  String message;

  loginResponse(
      {this.code,
        this.message,
        });

  loginResponse.fromJson(Map<String, dynamic> json) {
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

