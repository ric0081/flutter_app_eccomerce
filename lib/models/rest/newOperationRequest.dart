import 'package:json_annotation/json_annotation.dart';

part 'newOperationRequest.g.dart';

@JsonSerializable()
class newOperationRequest{

  String userName;
  String ipAddress;
  String deviceHash;
  bool rooted;
  String applicationVersion;
  String operativeSystemVersion;
  String operationSystem;
  String deviceManufacture;
  bool dataAgreement;


  newOperationRequest({
    this.userName,
    this.ipAddress,
    this.deviceHash,
    this.rooted,
    this.applicationVersion,
    this.operativeSystemVersion,
    this.operationSystem,
    this.deviceManufacture,
    this.dataAgreement
    });

//    factory newOperationRequest.fromJson(Map<String, dynamic> item) => _$NoteFromJson(item);

  /*newOperationRequest(
      {
        @required this.noteTitle,
        @required this.noteContent,
      }
      );
*/
  Map<String, dynamic> toJson() =>_$OperationRequestToJson(this);
 }