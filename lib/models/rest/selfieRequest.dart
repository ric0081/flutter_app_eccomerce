import 'package:json_annotation/json_annotation.dart';
part 'selfieRequest.g.dart';

@JsonSerializable()
class selfieRequest {

  @JsonKey(name: 'imageType')
  String imageType;

  @JsonKey(name: 'file')
  String file;

  selfieRequest(
    this.imageType, this.file,
  );

  factory selfieRequest.fromJson(Map<String, dynamic> json) => _$selfieRequestFromJson(json);
  Map<String, dynamic> toJson() => _$selfieRequestToJson(this);

  @override
  String toString() {
    return '[ ${this.file}, ${this.imageType} ]';
  }


/*
  String file;
  String imageType;
  selfieList(
    this.file,
    this.imageType,
    );


  factory selfieList.fromJson(dynamic json) {
    return selfieList(
        json['file'] as String,
        json['imageType'] as String);
  }

  @override
  String toString() {
    return '{ ${this.file}, ${this.imageType} }';
  }*/
/*
  Map<String, dynamic> toJson() =>_$selfieListToJson(this);

  selfieList _$SelfieFromJson(Map<String, dynamic> json) {
    return selfieList(
      file: json['file'] as String,
      imageType: json['imageType'] as String,
    );
  }

  Map<String, dynamic> _$selfieListToJson(selfieList instance) => <String, dynamic>{
    'file': instance.file,
    'imageType': instance.imageType,
  };*/

}

