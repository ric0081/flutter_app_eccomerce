
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontResponse.dart';
import 'package:flutter_app_eccomerce/services/VuOperations.dart';
import 'package:get_ip/get_ip.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_it/get_it.dart';

import 'models/rest/newOperationRequest.dart';
import 'models/rest/newOperationResponse.dart';

BuildContext globalContext; // Declare global variable to store context from StatelessWidget

class CreateUser extends StatefulWidget {

//  final BuildContext context;
  @override
  _CreateUserState createState() => _CreateUserState();

}

class _CreateUserState extends State<CreateUser> {
  File _imageFile;
  File _imageFile2;
  File _selfi;
  String img64;
  VuOperations get operationService => GetIt.I<VuOperations>();
  newOperationResponse opeResp;
  addFrontResponse  addFrontResp;

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  //  if(globalContext==null) globalContext=context;
    String _ip = '192.168.0.255';
    // TODO: implement build
    print("entro al crear");
    return Scaffold(
            appBar: AppBar(
                title: Text('Ingresar sus credenciales'),
              centerTitle: false,
              elevation: 1.0,
              backgroundColor: Colors.orange,
            ),
            body:Center(
                 child:Container (
                    child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            //_decideImageView(),
                            RaisedButton(
                              child: Text('Tomar Foto al frente del Documento Identidad',),
                              onPressed :() {
                                _openCamera(context);
                              },
                            ),
                            Container (
                                child: _imageFile==null? Text("Sin imagenes"): Image.file(_imageFile,width: 250,height: 250,),
                                ),

                            RaisedButton(
                                child: Text('Tomar Foto al dorso de tu documento de Identidad'),
                                onPressed:() {
                                  _openCamera2(context);
                                }
                            ),
                            Container (child: _imageFile2==null? Text("Sin imagenes"): Image.file(_imageFile2, width: 250,height: 250,),),
                            RaisedButton(
                                child: Text('Pruebas de Vida ... Selfie'),
                                onPressed:() {
                                  _openCamera2(context);
                                }
                            ),
                            RaisedButton(
                                child: Text('Registrar....'),
                                onPressed:() async {

                                  try {
                                    _ip  = await GetIp.ipAddress;
                                    } on PlatformException {
                                  }

                                  /*Creaccion de New Operacion...................*/
                                  final reqOpe = newOperationRequest(
                                      userName:"operatorKruger",
                                      ipAddress:_ip,
                                      deviceHash:"hash",
                                      rooted:false,
                                      applicationVersion:"1.0.0",
                                      operativeSystemVersion:"x.1",
                                      operationSystem:"Android",
                                      deviceManufacture:"",
                                      dataAgreement:true
                                  );

                                  final resultOperacion = await operationService.addOperation(reqOpe).then((response) {
                                      setState(() {
                                      });
                                      if (response.error) {
                                      //errorMessage = response.errorMessage ?? 'An error occurred';
                                        print("Error en crear la operacion");
                                      }
                                      opeResp = response.data;
                                  }
                                  );
                                  print("-----Se creo Nueva Operacion-------");
                                  int idOperacion  =opeResp.operationId;

                                  print(opeResp.operationId);
                                  //int idOperacion  =166;
                                  /*
                                  Validar existencia imagen
                                  if ( img64!=null) {

                                  }*/
                                  /*Creaccion de New Front...................*/
                                  final resfront = addFrontRequest(
                                      operationId: idOperacion.toString(),
                                      userName:"operatorKruger",
                                      analyzeOcr:"true",
                                      analyzeAnomalies:"true",
                                      file:img64,
                                  );

                                  final resultNewFront = await operationService.addFront(resfront).then((response) {
                                    setState(() {
                                    });
                                    if (response.error) {
                                      //errorMessage = response.errorMessage ?? 'An error occurred';
                                      print("Error response:");
                                      print(response.error);
                                    }
                                    addFrontResp = response.data;
                                  });
                                  print("-----Se creo Nuevo AddFront -------");
                                  /*Codigo de exito 909 */
                                  print(addFrontResp.code);
                                  print(addFrontResp.message);
                                  print(addFrontResp.code);

                                  if(addFrontResp.code==909){
                                    Scaffold
                                        .of(context)
                                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                                  }



                                }



                            ),


      ],
                ),




              ),
              ),

          );
}

 Widget _decideImageView(){
    if(_imageFile== null){
      return Text("Imagen por Tomar");
    }else{

       return Image.file(_imageFile, width: 100,height: 100,);
    }
 }


  void _openCamera(BuildContext context) async{
    // ignore: deprecated_member_use
    var picture=await ImagePicker.pickImage(source: ImageSource.gallery,);
    this.setState(() {
      _imageFile=picture;
      final  bytes = picture.readAsBytesSync();
      img64 = base64Encode(bytes);
      print("------- base 64-------");
      print(img64);
    });
    //Navigator.pushNamed(context, '/second');// Navigator.pop(context);
  }

  void _openCamera2(BuildContext context) async{
    // ignore: deprecated_member_use
    var picture2=await ImagePicker.pickImage(source: ImageSource.camera,);
    this.setState(() {
      _imageFile2=picture2;

    });
    //Navigator.pushNamed(context, '/second');// Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async{
    var picture=await ImagePicker.pickImage(source: ImageSource.gallery,);
    this.setState(() {
      _imageFile=picture;
    });
       //Navigator.of(context).pop();
    //Navigator.pushNamed(context, '/second');
   //  Navigator.pop(globalContext);
  }


  }


class ScreenArguments {
  File _imageFile1;
  File _imageFile2;
  ScreenArguments(_imageFile1, _imageFile2);
}



