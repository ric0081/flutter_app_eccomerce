
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class scanBarcodeResponse{
  int code;
  String message;
  Document document;

  scanBarcodeResponse({this.code, this.message, this.document});

  scanBarcodeResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    document = json['document'] != null
        ? new Document.fromJson(json['document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.document != null) {
      data['document'] = this.document.toJson();
    }
    return data;
  }
}

class Document {
  String number;
  String names;
  String lastNames;
  String birthdate;
  String gender;

  Document(
      {this.number, this.names, this.lastNames, this.birthdate, this.gender});

  Document.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    names = json['names'];
    lastNames = json['lastNames'];
    birthdate = json['birthdate'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['names'] = this.names;
    data['lastNames'] = this.lastNames;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    return data;
  }
}