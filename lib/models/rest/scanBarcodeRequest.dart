import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class scanBarcodeRequest {

  @JsonKey(name: 'file')
  String file;


  scanBarcodeRequest({this.file});

  scanBarcodeRequest.fromJson(Map<String, dynamic> json) {
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    return data;
  }
}