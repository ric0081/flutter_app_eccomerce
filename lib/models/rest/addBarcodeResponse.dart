import 'package:json_annotation/json_annotation.dart';

class addBarcodeResponse {
  int code;
  String message;


  addBarcodeResponse({this.code, this.message});

  addBarcodeResponse.fromJson(Map<String, dynamic> json) {
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