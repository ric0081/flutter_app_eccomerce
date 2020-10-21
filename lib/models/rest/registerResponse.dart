import 'package:json_annotation/json_annotation.dart';

part 'registerResponse.g.dart';

@JsonSerializable()
class registerResponse{
  int code;
  String message;

  registerResponse({
    this.code,
    this.message,
    });

//    factory newOperationRequest.fromJson(Map<String, dynamic> item) => _$NoteFromJson(item);

  /*newOperationRequest(
      {
        @required this.noteTitle,
        @required this.noteContent,
      }
      );
*/
  factory registerResponse.fromJson(Map<String, dynamic> item) => _$registerResponseFromJson(item);

 }