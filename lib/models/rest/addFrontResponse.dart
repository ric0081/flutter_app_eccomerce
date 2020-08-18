import 'package:json_annotation/json_annotation.dart';

part 'addFrontResponse.g.dart';

@JsonSerializable()
class addFrontResponse{
  int code;
  String message;
  String detectedCountry;
  bool addBackRequired;
  bool addDocumentPictureRequired;
  bool documentPictureDetected;
  bool containsBarcode;
  bool barcodeDetected;

  addFrontResponse({
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
  factory addFrontResponse.fromJson(Map<String, dynamic> item) => _$addFrontResponseFromJson(item);

 }