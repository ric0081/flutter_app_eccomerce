import 'package:json_annotation/json_annotation.dart';
part 'newOperationResponse.g.dart';

@JsonSerializable()
class newOperationResponse{

  int code;
  String message;
  int operationId;

  newOperationResponse({
    this.code,
    this.message,
    this.operationId,
    });

    factory newOperationResponse.fromJson(Map<String, dynamic> item) => _$NoteFromJson(item);
  }