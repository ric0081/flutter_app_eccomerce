import 'package:json_annotation/json_annotation.dart';
/*
https://javiercbk.github.io/json_to_dart/

*/
class Register {
  String operationId;
  String userName;
  List<SelfieList> selfieList;

  Register({this.operationId, this.userName, this.selfieList});

  Register.fromJson(Map<String, dynamic> json) {
    operationId = json['operationId'];
    userName = json['userName'];
    if (json['selfieList'] != null) {
      selfieList = new List<SelfieList>();
      json['selfieList'].forEach((v) {
        selfieList.add(new SelfieList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operationId'] = this.operationId;
    data['userName'] = this.userName;
    if (this.selfieList != null) {
      data['selfieList'] = this.selfieList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelfieList {
  String file;
  String imageType;

  SelfieList({this.file, this.imageType});

  SelfieList.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['imageType'] = this.imageType;
    return data;
  }
}