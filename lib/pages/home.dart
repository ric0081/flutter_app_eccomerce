import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app_eccomerce/Login.dart';
import 'package:flutter_app_eccomerce/pages/DetalleTransferencia.dart';
import 'package:flutter_app_eccomerce/pages/collection.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_eccomerce/models/alert_dialogs.dart';
import 'package:flutter_app_eccomerce/pages/collection.dart';
import 'package:flutter_app_eccomerce/pages/income.dart';
import 'package:flutter_app_eccomerce/pages/saldos.dart';
import 'package:flutter_app_eccomerce/pages/category.dart';

/*Todas mis importaciones*/
import 'package:flutter_app_eccomerce/componets/HorizontalListView.dart';
import 'package:flutter_app_eccomerce/componets/Productos.dart';

import 'loginState.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<void> iniccamara() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
}



class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class  _HomePageState extends State<HomePage>{
  Stream<QuerySnapshot> _query;

  @override
    void initState(){
    print("llege");
    super.initState();
    iniccamara();
  }
  SharedPreferences sharedPreferences;
  AlertDialogs _alertDialogs;
//  variables to handle the input fields

//  lets create a list of the available choices
  List<Choice> choices = const <Choice>[
    const Choice(title: "Transferir", icon: Icons.attach_money),
    const Choice(title: "Saldo", icon: Icons.toc),
   // const Choice(title: "Pagar", icon: Icons.category)
  ];

  //  lets create a list of the available choices

  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(microseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0 ,
        dotColor: Colors.orange,
      ),
    );

    /*Encabezado dde la vista principal*/
    return Consumer<LoginState>(
         builder: (BuildContext context, LoginState value, Widget child){
            var user=Provider.of<LoginState>(context).currentUser();
            _query =Firestore.instance.collection('cuentas').where("id",isEqualTo: user.uid).snapshots();
          return Scaffold(
            appBar: new AppBar(
      //       elevation: 0.1,
                title: Text('Mis cuentas'),
                centerTitle: false,
                elevation: 1.0,
                backgroundColor: Colors.orange,
                //actions: <Widget>[
                //  new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
                //  new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: (){}),
                //new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),

                //],
                actions: <Widget>[



                /*  PopupMenuButton<Choice>(
                    icon: Icon(Icons.add),
                    onSelected: onItemMenuPress,
                    itemBuilder: (BuildContext context) {
                      return choices.map((Choice choice) {
                        return PopupMenuItem<Choice>(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  choice.icon,
                                  color: Colors.orange,
                                ),
                                Container(
                                  width: 10.0,
                                ),
                                Text(
                                  choice.title,
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ],
                            ));
                      }).toList();
                    },
                  ),
                  */
                  new IconButton(icon: Icon(Icons.home), onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){}));
                  }) ,
                ]
            ),

            /*menu izquierdo */
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  // header menu
                  UserAccountsDrawerHeader(

                   accountName: Text('Demo', ),
                    accountEmail: Text(user.email),


                      currentAccountPicture: GestureDetector(
                          child:

                                CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child:
                                      Icon(Icons.person,color: Colors.white,),

                          ),
                        ),
                        decoration: new BoxDecoration(
                            color: Colors.orange
                        ),

                  ),

                  /*Body de menu*/
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Productos del Mes'),
                      leading: Icon(Icons.home),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Token Digital'),
                      leading: Icon(Icons.toc),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Abrir una cuenta'),
                      leading: Icon(Icons.search),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Categorias'),
                      leading: Icon(Icons.dashboard),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Favoritos'),
                      leading: Icon(Icons.favorite),
                    ),
                  ),

                  Divider(),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Configuraciones'),
                      leading: Icon(Icons.settings,color: Colors.blue,),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Ayuda'),
                      leading: Icon(Icons.help, color: Colors.green,),
                    ),
                  ),


                  InkWell(
                    onTap: () {
                      Provider.of<LoginState>(context).logout();
                    //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
                    },
                    child:
                    ListTile(
                      title: Text('Salir'),
                      leading: Icon(Icons.exit_to_app, color: Colors.black,),
                    ),
                    //Text("Log Out", style: TextStyle(color: Colors.white)),
                  ),


                ],
              ),
            ),

      /*body: WillPopScope(
        onWillPop: () { _alertDialogs.closeApp();},
        child: InkWell(
          onDoubleTap: (){
            _alertDialogs.showExpenseDialog(_expenseAmountController);
          },
          onTap: (){
            _alertDialogs.showIncomeAlert(_incomeAmountController);
          },
          child: new Column(
            children: <Widget>[
              _showGoalAtScreen(),
              Visibility(
                visible: transactionsList.length > 0,
                child: Expanded(
                  child: ListView.builder(
                      itemCount:transactionsList.length,
                      itemBuilder: (context, int index){
                        return Card(color: Colors.grey.shade50,
                          child: ListTile(
                            leading: _functions.returnIcon(transactionsList[index].transactionType),
                            title: _functions.returnAmount(transactionsList[index].transactionType, transactionsList[index].categorytype ,transactionsList[index].amount),
                            subtitle: _functions.displayDate(transactionsList[index].transactionDay, transactionsList[index].transactionMonth, transactionsList[index].transactionYear, transactionsList[index].transactionWeekDay),
                            trailing: FlatButton(onPressed: (){
                              viewDialog(index, transactionsList, context);
                            }, child: Icon(Icons.more_horiz)),
                          ),
                        );}),
                ),
              ),
              Visibility(
                visible: transactionsList.length <= 0,
                child: Padding(
                  padding: const EdgeInsets.only(top:60.0),
                  child: new ListTile(title: ListTile(
                      title: Icon(Icons.monetization_on, color: Colors.grey, size: 70.0,),
                      subtitle: new Center(child: Text("Tap to add  income!", style: TextStyle(color: Colors.grey, fontSize: 16.0),))),
                    subtitle: new Center(child: Text("Double tap to add  expense!", style: TextStyle(color: Colors.grey, fontSize: 16.0),)),),
                ),
              )
            ],
          ),
        ),
      ),
      */
      //body: new ListView(
      //    children: <Widget>[

      /*llamada a las imagenes de carrosel*/
      /*image_carousel,*/

      /*Padding entre widget*/
      /* new Padding(padding: const EdgeInsets.all(8.0),
                child: new Text('Cuentas'),
          ),
          */

      /**Horizontal list view comienza aquiiii....*/
      //HorizontalList(),
      /*
              new Padding(padding: const EdgeInsets.all(20.0),
                  child: new Text('Hola'),
              ),
            */
      /*Grid View*/



      /*Container(
            height:1900,
            child: Products(),
          )*/
      // ],
      //),
/*
      bottomNavigationBar: new Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: ListTile(
                        title: new Text("Balance:"),
                        subtitle: _viewBalance(),
                      ),
                    ),

                    Expanded(
                      child: ListTile(
                        title: new Text("Spent so far:"),
                        subtitle: _viewExpence(),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: MaterialButton(
                          onPressed: (){
                            // _alertDialogs.summaryAlert(context);
                          },
                          child: Material(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(20.0),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                                child: new Text("Summary", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ))),
                    ),


                  ],
                ),
              ),
 */          /*cuerpo*/
              body:
                _buildBody(context) ,
          );

        });
   }


  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _query,
      builder: (context, snapshot){
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }


  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.numeroCuenta),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
            title: Text(record.numeroCuenta),
            subtitle: Text(record.tipoCuenta),
            leading: Icon(Icons.payment,size: 40.0,color: Colors.green,),
            //trailing: Text(''+record.saldo.toString()),
            trailing:
              new Column(
                children: <Widget>[

                  PopupMenuButton<Choice>(
                    icon: Icon(Icons.more_vert),
                    onSelected:(Choice choice) {
                        renderizar(choice, record);
                    },
                    itemBuilder: (BuildContext context) {
                      return choices.map((Choice choice) {
                        return PopupMenuItem<Choice>(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  choice.icon,
                                  color: Colors.green,
                                ),
                                Container(
                                  width: 10.0,
                                ),
                                Text(
                                  choice.title,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ));
                      }).toList();
                    },
                  ),









                  /*new Container(
                    child: new IconButton(
                      icon: new Icon(Icons.more_vert),
                      onPressed:() {  },
                    ),
                    //     margin: EdgeInsets.only(top: 25.0),
                  )*/
                ],
              ),

            //Icon(Icons.more_vert,size: 40.0),

            onTap: (){

            }
                //=>
              //record.reference.updateData({'votes':record.votes+1}),

              /*Firestore.instance.runTransaction((transaction) async{
              final freshSnapshot = await transaction.get(record.reference);
              final fresh = Record.fromSnapshot(freshSnapshot);
              await transaction.update(record.reference,{'saldo':fresh.saldo});
              }),*/
        ),
      ),
    );
  }


/*

  Widget _buildListView(){

    return SafeArea(
      child: Column(
        children: <Widget>[
          //_selector(),
          StreamBuilder<QuerySnapshot>(
            stream: _query,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
              if (data.hasData) {
                return _buildList(context, data.data.documents);
                /*return collection(
                  documents: data.data.documents,
                   );*/
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );

*/
/*
      return ListView.builder(


              itemCount: 5,
              itemBuilder: (_,index){
                  return ListTile(
                    title: Text ('Cuenta de Ahorro #$index' ),
                    subtitle: Text ('0000005205820520522' ),
                    leading: Icon (Icons.monetization_on) ,
                    trailing: Icon (Icons.arrow_forward) ,
                    onTap: (){
                      Navigator.push(
                          context,
                           MaterialPageRoute (builder: (context)=> DetalleTransferencia (index))
                        );
                    },

                  );
              },

        );

*/


/*
  Widget _viewBalance() {
    if(totalExpense > totalIncome){
      return new Text("You have negative balance", style: TextStyle(color: Colors.red, fontSize: 16.0),);

    }else{
      return  new Text("\$$currentBalance", style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold),);

    }
  }
*/
  /*Widget _viewExpence() {
    return  new Text("\$$spentSoFar", style: TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),);
  }*/

      void onItemMenuPress(Choice choice) {
        if (choice.title == "Transferir") {
         //  Navigator.push(context, MaterialPageRoute(builder: (context) => AddIncome(campos)));
        } else if (choice.title == "Saldo") {
         // Navigator.push(context, MaterialPageRoute(builder: (context) => AddIncome(campos)));
        } else if (choice.title == "Pagar") {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewIncome()));
          /*   }else if (choice.title == "view expenses") {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseView()));
        }else if (choice.title == "add category") {
           _alertDialogs.showCategoryAlert(_categoryController);
          */
        }
      }

  void renderizar(Choice choice, Record campos) {
    if (choice.title == "Transferir") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddIncome(campos,cameras)));
    } else if (choice.title == "Saldo") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddSaldos(campos)));
    } else if (choice.title == "Pagar") {
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewIncome()));
      /*   }else if (choice.title == "view expenses") {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseView()));
        }else if (choice.title == "add category") {
           _alertDialogs.showCategoryAlert(_categoryController);
          */
    }else if (choice.title == "view categories") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
    }
  }
}
//this will be the choices class
class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}


class Record {
  final String numeroCuenta;
  final String saldo;
  final String nombre;
  final String tipoCuenta;
  final String id;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['cuenta'] != null),
        assert(map['saldo'] != null),
        assert(map['id'] != null),
        assert(map['nombre'] != null),
        assert(map['tipoCuenta'] != null),

        numeroCuenta = map['cuenta'],
        saldo = map['saldo'],
        id = map['id'],
        nombre = map['nombre'],
        tipoCuenta = map['tipoCuenta']
;

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$numeroCuenta:$saldo>";
}



