import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_eccomerce/models/rest/Register.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/addFrontResponse.dart';
import 'package:flutter_app_eccomerce/models/rest/endOperationRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/registerRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/selfieRequest.dart';
import 'package:flutter_app_eccomerce/pages/widgetCamaraBack.dart';
import 'package:flutter_app_eccomerce/services/VuOperations.dart';
import 'package:get_it/get_it.dart';

import 'dart:io';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../Login.dart';
import 'createUserBack.dart';
import 'image_converter.dart';


import 'package:flutter_app_eccomerce/models/rest/newOperationRequest.dart';
import 'package:flutter_app_eccomerce/models/rest/newOperationResponse.dart';

BuildContext globalContext; // Declare global variable to store context from StatelessWidget

class widgetPruebaVida extends StatefulWidget {

 final List<CameraDescription> camerasdescripcion;
 final int idOperation;
  //CreateUserFront ({this.camerasdescripcion});
 const widgetPruebaVida({
    Key key,
    @required this.camerasdescripcion,
   @required this.idOperation,
  }) : super(key: key);



 /*List<CameraDescription> cameras;
  widgetCamaraFront(cameras){
    this.cameras =cameras;
  }*/

  @override
  _widgetPruebaVidaState createState() => _widgetPruebaVidaState();

}

class _widgetPruebaVidaState extends State<widgetPruebaVida>
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
          controller = new CameraController(widget.camerasdescripcion[1], ResolutionPreset.ultraHigh);

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
          quarterTurns: 0 ,
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
                          DisplayPictureScreen(imagePath: path,listadocamara: widget.camerasdescripcion,operationId:widget.idOperation),
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
  int operationId;
  DisplayPictureScreen({Key key, this.imagePath, this.listadocamara,this.operationId}) : super(key: key);

  VuOperations get operationService => GetIt.I<VuOperations>();
  newOperationResponse opeResp;
  addFrontResponse addFrontResp;

  @override
  Widget build(BuildContext context) {


    ProgressDialog pr;
    bool _progressBarActive = true;
    // Custom body test
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Download,
      textDirection: TextDirection.rtl,
      isDismissible: true,
    );
    pr.style(
      message:'Espera un momento mientras procesamos tu informacion',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(color: Colors.orange, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(color: Colors.orange, fontSize: 19.0, fontWeight: FontWeight.w600),
    );


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

          String usuario="pin09";

            await pr.show();


            String fotofrontal=_obtenerBase64(imagePath);
            /* Logica de VU**/
            String _ip = '192.168.0.255';
            SelfieList a =  SelfieList( file:fotofrontal, imageType:"SN" );
            //selfieList self;
            List<SelfieList > self = List<SelfieList>();
            self.add(a);
            print(operationId);

            /*Creaccion de New Operacion...................*/
            //final reqOpe = registerRequest(
            //  operationId:"1958",
            //  userName: "operatorKruger",
            //  selfieLista: self,
            //  );

            final reqOpe = Register(
              operationId: operationId.toString(),
              userName: usuario,
              selfieList: self,
            );
            final resultOperacion = await operationService.register(reqOpe)
               // .timeout(const Duration(seconds: 60))
                .then((response) {
              /*setState(() {

              })*/
              ;
              if (response.error) {
                //errorMessage = response.errorMessage ?? 'An error occurred';
                print("Error en registrar Selfie ");
              }
//              opeResp = response.data;
            }
            );
            print("-----Se registro el selfie-------");

            /*Creaccion de New Operacion...................*/
            final reqOpeend = endOperationRequest(
              operationId: operationId.toString(),
                userName: usuario,
            );


            final resultOperacion2 = await operationService.endOperation(reqOpeend)
            // .timeout(const Duration(seconds: 60))
                .then((response) {
              /*setState(() {

              })*/
              ;
              if (response.error) {
                //errorMessage = response.errorMessage ?? 'An error occurred';
                print("Error en crear la operacion");
              }
              //opeResp = response.;
            }
            );
            print("-----Se creo Nueva Operacion-------");

            pr.hide().whenComplete((){
            /*Creaccion de New Front...................*/
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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




