import 'package:json_annotation/json_annotation.dart';

part 'addFrontRequest.g.dart';

@JsonSerializable()
class addFrontRequest{

  String operationId;
  String userName;
  bool analyzeOcr;
  bool analyzeAnomalies;
  String file;


  addFrontRequest({
    this.operationId,
    this.userName,
    this.analyzeOcr,
    this.analyzeAnomalies,
    this.file,
    });

//    factory newOperationRequest.fromJson(Map<String, dynamic> item) => _$NoteFromJson(item);

  /*newOperationRequest(
      {
        @required this.noteTitle,
        @required this.noteContent,
      }
      );
*/
  Map<String, dynamic> toJson() =>_$addFrontRequestToJson(this);
 }