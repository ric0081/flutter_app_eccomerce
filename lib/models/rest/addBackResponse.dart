import 'package:json_annotation/json_annotation.dart';

part 'addBackResponse.g.dart';

@JsonSerializable()
class addBackResponse{
  int code;
  String message;
  String detectedCountry;
  bool addBackRequired;
  bool addDocumentPictureRequired;
  bool documentPictureDetected;
  bool containsBarcode;
  bool barcodeDetected;

  addBackResponse({
    this.code,
    this.message,
    this.detectedCountry,
    this.addBackRequired,
    this.addDocumentPictureRequired,
    this.documentPictureDetected,
    this.containsBarcode,
     this.barcodeDetected
    });

//    factory newOperationRequest.fromJson(Map<String, dynamic> item) => _$NoteFromJson(item);

  /*newOperationRequest(
      {
        @required this.noteTitle,
        @required this.noteContent,
      }
      );
*/
  factory addBackResponse.fromJson(Map<String, dynamic> item) => _$addBackResponseFromJson(item);

 }