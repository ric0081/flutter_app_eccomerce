import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontResponse.dart';
import 'package:flutter_app_eccomerce/pages/widgetCamaraBack.dart';
import 'package:flutter_app_eccomerce/services/VuOperations.dart';
import 'package:get_it/get_it.dart';

import 'dart:io';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'createUserBack.dart';
import 'image_converter.dart';


import 'package:flutter_app_eccomerce/models/rest/newOperationRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/newOperationResponse.dart';

BuildContext globalContext; // Declare global variable to store context from StatelessWidget

class widgetCamaraFront extends StatefulWidget {

 final List<CameraDescription> camerasdescripcion;
  //CreateUserFront ({this.camerasdescripcion});
 const widgetCamaraFront({
    Key key,
    @required this.camerasdescripcion,
  }) : super(key: key);



 /*List<CameraDescription> cameras;
  widgetCamaraFront(cameras){
    this.cameras =cameras;
  }*/

  @override
  _widgetCamaraFrontState createState() => _widgetCamaraFrontState();

}

class _widgetCamaraFrontState extends State<widgetCamaraFront>
//    with SingleTickerProviderStateMixin
{
    CameraController controller;
    bool _cameraInitialized = false;
    Future<void> _initializeControllerFuture;
      bool showFab = true;
     bool _loading = true;
    CameraImage _savedImage;

    final DynamicLibrary convertImageLib = Platform.isAndroid
        ? DynamicLibrary.open("libconvertImage.so")
        : DynamicLibrary.process();
    Convert conv;




    @override
      void initState() {
        /* Poner en horizontal el widget */
       //WidgetsFlutterBinding.ensureInitialized();
        //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) {







          super.initState();
          // Para visualizar la salida actual de la cámara, es necesario
          // crear un CameraController
          controller = new CameraController(widget.camerasdescripcion[0], ResolutionPreset.ultraHigh);

          // A continuación, debes inicializar el controlador. Esto devuelve un Future!

          controller.initialize().then((_) async {
            /*await controller.startImageStream((CameraImage image) => _processCameraImage(image));
            setState(() {
              _cameraInitialized = true;
            });
*/
            /*cambio*/
            if (!mounted) {
              return;
            }
            setState(() {});
          });
          //});

          conv = convertImageLib.lookup<NativeFunction<convert_func>>(
              'convertImage').asFunction<Convert>();

      //  _initializeControllerFuture = controller.initialize();
      }


    void _processCameraImage(CameraImage image) async {
      setState(() {
        _savedImage = image;
      });
    }

      @override
      void dispose() {
        controller.dispose();
        super.dispose();
      }


      Widget contruccion(BuildContext context) {
        if (!controller.value.isInitialized) {
          return new Container();
        }
/*

        NativeDeviceOrientation orientation =
        NativeDeviceOrientationReader.orientation(context);

        int turns;
        switch (orientation) {
          case NativeDeviceOrientation.landscapeLeft:
            turns = -1;
            break;
          case NativeDeviceOrientation.landscapeRight:
            turns = 1;
            break;
          case NativeDeviceOrientation.portraitDown:
            turns = 2;
            break;
          default:
            turns = 0;
            break;
        }*/

        final size = MediaQuery.of(context).size;
        final deviceRatio = size.width / size.height;




        return RotatedBox(
          quarterTurns: -1,
          child: Transform.scale(
            scale: 1,
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),
        );


   /* return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
     // turns: AlwaysStoppedAnimation(270/360),
      child: new CameraPreview(controller),
    );*/
        /*return new RotationTransition(
          turns: AlwaysStoppedAnimation(270/360),
          child: new CameraPreview(controller),
        );*/

      }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
   /*   appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Tomar Foto Frontal"),
        elevation: 0.7,
      ),
    */


      body:
          Center(
            child:Container (
                  child:Wrap(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      contruccion(context),
                      //              CameraScreen(widget.cameras),
          ],),),),
          /*
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Si el Future está completo, muestra la vista previa
                return CameraPreview(controller);
              } else {
                // De lo contrario, muestra un indicador de carga
                return Center(child: CircularProgressIndicator());
              }
            },
          ),*/

        /*Center(
            child:Container (
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      contruccion(context),
                      //              CameraScreen(widget.cameras),
          ],
                  ),),),
*/
        floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.camera_alt),
              // Agrega un callback onPressed
                onPressed: () async {
/*
                  imglib.Image img;

                  if(Platform.isAndroid){
                    // Allocate memory for the 3 planes of the image
                    Pointer<Uint8> p = allocate(count: _savedImage.planes[0].bytes.length);
                    Pointer<Uint8> p1 = allocate(count: _savedImage.planes[1].bytes.length);
                    Pointer<Uint8> p2 = allocate(count: _savedImage.planes[2].bytes.length);

                    // Assign the planes data to the pointers of the image
                    Uint8List pointerList = p.asTypedList(_savedImage.planes[0].bytes.length);
                    Uint8List pointerList1 = p1.asTypedList(_savedImage.planes[1].bytes.length);
                    Uint8List pointerList2 = p2.asTypedList(_savedImage.planes[2].bytes.length);
                    pointerList.setRange(0, _savedImage.planes[0].bytes.length, _savedImage.planes[0].bytes);
                    pointerList1.setRange(0, _savedImage.planes[1].bytes.length, _savedImage.planes[1].bytes);
                    pointerList2.setRange(0, _savedImage.planes[2].bytes.length, _savedImage.planes[2].bytes);

                    // Call the convertImage function and convert the YUV to RGB
                    Pointer<Uint32> imgP = conv(p, p1, p2, _savedImage.planes[1].bytesPerRow,
                        _savedImage.planes[1].bytesPerPixel, _savedImage.planes[0].bytesPerRow, _savedImage.height);

                    // Get the pointer of the data returned from the function to a List
                    List imgData = imgP.asTypedList((_savedImage.planes[0].bytesPerRow * _savedImage.height));
                    // Generate image from the converted data
                    img = imglib.Image.fromBytes(_savedImage.height, _savedImage.planes[0].bytesPerRow, imgData);

                    // Free the memory space allocated
                    // from the planes and the converted data
                    free(p);
                    free(p1);
                    free(p2);
                    free(imgP);
                  }else if(Platform.isIOS){
                    img = imglib.Image.fromBytes(
                      _savedImage.planes[0].bytesPerRow,
                      _savedImage.height,
                      _savedImage.planes[0].bytes,
                      format: imglib.Format.bgra,
                    );

                  }
                  Navigator.push(context, MaterialPageRoute(builder:(context) => new DisplayPictureScreen(imagePath:img)));
*/

                // Toma la foto en un bloque de try / catch. Si algo sale mal,
                // atrapa el error.
                try {
                  // Ensure the camera is initialized
                  await _initializeControllerFuture;

                  // Construye la ru*ta donde la imagen debe ser guardada usando
                  // el paquete path.
                  final path = join(
            //
                    (await getTemporaryDirectory()).path,
                    '${DateTime.now()}.png',
                  );

                  // Attempt to take a picture and log where it's been saved
                  await controller.takePicture(path);
                  // En este ejemplo, guarda la imagen en el directorio temporal. Encuentra
                  // el directorio temporal usando el plugin `path_provider`.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DisplayPictureScreen(imagePath: path,listadocamara: widget.camerasdescripcion,),
                    ),
                  );
                } catch (e) {
                  // Si se produce un error, regístralo en la consola.
                  print(e);
                }




                  }
                ),

    );
                  }




}
      // Un Widget que muestra la imagen tomada por el usuario

class DisplayPictureScreen extends StatelessWidget {
//  imglib.Image imagePath;
  var imagePath;
  var listadocamara;
  DisplayPictureScreen({Key key, this.imagePath, this.listadocamara}) : super(key: key);

  VuOperations get operationService => GetIt.I<VuOperations>();
  newOperationResponse opeResp;
  addFrontResponse addFrontResp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirma enviar esta foto VU?'),
        backgroundColor: Colors.orange,
      ),
      // La imagen se almacena como un archivo en el dispositivo. Usa el
      // constructor `Image.file` con la ruta dada para mostrar la imagen

      body:
      Center(
        child: Container(
          child: Wrap(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           //   Image.memory(imglib.encodeJpg(imagePath)),
              Image.file(File(imagePath)),
            ],),),),
      //   Image.file(File(imagePath)),


      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios),
          // Agrega un callback onPressed
          onPressed: () async {
            // Toma la foto en un bloque de try / catch. Si algo sale mal,

            String fotofrontal=_obtenerBase64(imagePath);

            /* Logica de VU**/
            String _ip = '192.168.0.255';
            /*Creaccion de New Operacion...................*/
            final reqOpe = newOperationRequest(
                userName: "operatorKruger",
                ipAddress: _ip,
                deviceHash: "hash",
                rooted: false,
                applicationVersion: "1.0.0",
                operativeSystemVersion: "x.1",
                operationSystem: "Android",
                deviceManufacture: "",
                dataAgreement: true
            );

            final resultOperacion = await operationService.addOperation(reqOpe)
               // .timeout(const Duration(seconds: 60))
                .then((response) {
              /*setState(() {

              })*/
              ;
              if (response.error) {
                //errorMessage = response.errorMessage ?? 'An error occurred';
                print("Error en crear la operacion");
              }
              opeResp = response.data;
            }
            );
            print("-----Se creo Nueva Operacion-------");
            print("IdOperacion----");
            int idOperacion = opeResp.operationId;

            print(opeResp.operationId);
            //int idOperacion  =166;
            /*
                                  Validar existencia imagen
                                  if ( img64!=null) {

                                  }*/
            /*Creaccion de New Front...................*/
            final resfront = addFrontRequest(
              operationId: idOperacion.toString(),
              userName: "operatorKruger",
              analyzeOcr: true,
              analyzeAnomalies: true,
              file: fotofrontal,
            );
            print("pasoooooo 1");
            final resultNewFront = await operationService.addFront(resfront)
              //.timeout(const Duration(seconds: 120))
                .then((response) {
              //setState(() {});
              if (response.error) {
                //errorMessage = response.errorMessage ?? 'An error occurred';
                print("Error response:");
                print(response.error);
              }
              addFrontResp = response.data;
              print("-----Se creo Nuevo AddFront -------");
              /*Codigo de exito 909 */
              print(addFrontResp.code);
              print(addFrontResp.message);
              print(addFrontResp.code);

              if (addFrontResp.code == 909) {
                print('Proceso correctamente');

              }else{
                 print('Error en capturar el front');
              }

              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateUserBack(camerasdescripcion: listadocamara,idOperacion:idOperacion)));

            });



          }),
    );
  }


}



_obtenerBase64(imagenreal) {
  var img64="";
  print('--- base 64----');

 // String decodedFile = utf8.decode(base64.decode(imagenreal));
 // print('decoded file: $decodedFile');
;
 File file = File(imagenreal);
 Uint8List bytes = file.readAsBytesSync();
  img64 = base64Encode(bytes);

  print(img64);
  print('--- base 64----');




  // convertImagetoPng(Image(imagenreal));
   // var picture=await ImagePicker.pickImage(source: imagenreal,);
    return img64;
}




