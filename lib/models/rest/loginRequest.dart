import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class loginRequest {
  String applicationVersion;
  String operativeSystemVersion;
  String operationSystem;
  String deviceManufacture;
  String deviceName;
  String userName;
  List<SelfieList> selfieList;

  loginRequest(
      {this.applicationVersion,
        this.operativeSystemVersion,
        this.operationSystem,
        this.deviceManufacture,
        this.deviceName,
        this.userName,
        this.selfieList});

  loginRequest.fromJson(Map<String, dynamic> json) {
    applicationVersion = json['applicationVersion'];
    operativeSystemVersion = json['operativeSystemVersion'];
    operationSystem = json['operationSystem'];
    deviceManufacture = json['deviceManufacture'];
    deviceName = json['deviceName'];
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
    data['applicationVersion'] = this.applicationVersion;
    data['operativeSystemVersion'] = this.operativeSystemVersion;
    data['operationSystem'] = this.operationSystem;
    data['deviceManufacture'] = this.deviceManufacture;
    data['deviceName'] = this.deviceName;
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