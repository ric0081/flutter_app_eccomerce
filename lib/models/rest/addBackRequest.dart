import 'package:json_annotation/json_annotation.dart';

part 'addBackRequest.g.dart';

@JsonSerializable()
class addBackRequest{

  String operationId;
  String userName;
  bool analyzeOcr;
  bool analyzeAnomalies;
  String file;


  addBackRequest({
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
  Map<String, dynamic> toJson() =>_$addBackToJson(this);
 }