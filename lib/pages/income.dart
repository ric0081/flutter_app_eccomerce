import 'dart:collection';
import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_eccomerce/pages/saldos.dart';
import 'package:intl/intl.dart';
import '../pages/home.dart';
import '../models/category_model.dart';
import 'package:flutter_app_eccomerce/Login.dart';


class AddIncome extends StatefulWidget {
  //String incomeAmount;
  AddIncome(this.record);
  Record record;

  @override
  _AddIncomeState createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  //var db = new DatabaseHelper();
  HomePage home;
  int radioGroupValue;
  double income;
  String description = "";
  String category = "";
  String categoryToDisplay = " ";
  final List<CategoryModel> categoryList = <CategoryModel>[];
  TextEditingController _categoryController = new TextEditingController();
  TextEditingController cuentaDestinoController = new TextEditingController(text:"");
  TextEditingController cuentaOrigenController = new TextEditingController();
  TextEditingController saldoController = new TextEditingController(text:"");
  TextEditingController montoTransfercontroller =  new TextEditingController(text:"");
  Record record;
  @override
  void initState() {
    super.initState();
    categoryToDisplay = "";
    category = "";
    getIncomeCategories();
    record= widget.record;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    saldoController.dispose();
    super.dispose();
  }

  void addTransaction(double amount, String transaction,
      {String category, String description}) async {

    var now = new DateTime.now();
    var day = new DateFormat('dd');
    var weekDay = new DateFormat('EEEE');
    var month = new DateFormat('MMM');
    var year = new DateFormat('y');

    String getDayString = day.format(now);
    String weekDayString = weekDay.format(now);
    String monthString = month.format(now);
    String yearString = year.format(now);
    int convertYear =int.parse(yearString);


/*

    //Add transaction
    int transactionId = await db.insertTransaction(
        new Master(getDayString, weekDayString, monthString, convertYear, amount, transaction, categorytype: category, transactionDescription: description));
//    get the added transaction
    Master item = await db.getSingleTransaction(transactionId);
    Ads.showFullScreenAd();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    print(transactionId);*/
  }

  // we will use this method to retrieve the transactions
  void getIncomeCategories() async {
 /*   List categories;
    categories = await db.getAllCategories();
    print(categories.toString());
    for (int i = 0; i < categories.length; i++) {
      CategoryModel category = CategoryModel.map(categories[i]);
      if(category.category_type == "income"){
        setState(() {
          categoryList.insert(0, category);
//        getBalance(transactionsList.length);
          print(categoryList.length);
        });
      }
    }*/
  }

  void _showCategoryAlert() {
    _categoryController.text = "";
    var alert = new AlertDialog(
      content: new Row(
        children: <Widget>[
          Flexible(
            child: new TextField(
              controller: _categoryController,
              autofocus: true,
              decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "add category",
                  hintText: "category name"),
            ),
          )
        ],
      ),
      /*actions: <Widget>[
        new FlatButton(
            onPressed: () {
              addCategory(_categoryController.text, context, "income");
            },
            child: new Text("add category")),

      ],*/
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void addCategory(String categoryName, context, categoryType) async{
    /*int categoryId = await db.insertCategory(CategoryModel(categoryName, categoryType));
    CategoryModel item = await db.getSingleCategory(categoryId);
    setState(() {
      categoryList.insert(0, item);
    });
    Navigator.pop(context);
    print(categoryId);*/
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: (){
          Navigator.pop(context);
        }),
        title: new Text("Transferencia"),
        backgroundColor: Colors.orange,
        centerTitle: false,
        elevation: 1.0,

        /*actions: <Widget>[
          FlatButton(
            color: Colors.blue.shade700,
            textColor: Colors.white,
            onPressed: (){
              _showCategoryAlert();
            },
            child: Text("add category"),
          )
        ],*/

      ),

      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: new Text("Settings"),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[

                    new ListTile(
                      leading: Icon(Icons.add_alert),
                      title: new Text("Notifications"),
                      //trailing: new Switch(value: notificationVal, onChanged: _onChanged1),
                    ),

                    new ListTile(
                      leading: Icon(Icons.clear),
                      title: new Text("clear datadase"),
                      onTap: (){},
                    ),

//                    new ListTile(
//                      leading: Icon(Icons.language),
//                      title: new Text("Language"),
//                      onTap: (){},
//                    ),
                    Divider(),
                    new ListTile(
                      leading: Icon(Icons.info_outline),
                      title: new Text("About"),
                      onTap: (){},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text("developed by: Ricardo Eneque", style: TextStyle(color: Colors.grey),),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Form(
          key: formkey,
          child:
          Column(
//            direction: Axis.vertical,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(15)),
              ListTile(
                title: TextFormField(
                  initialValue: widget.record.numeroCuenta,
                  //controller: cuentaOrigenController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Cuenta de Origen",
                      hintText: ""),
                      onSaved: (val) {
                      setState(() {
                        income = double.parse(val);
                      });
                  },
                  validator: (val) => val == "" ? val : null,
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  controller: cuentaDestinoController,
                  //initialValue: "",
                  autocorrect: true,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Cuenta de Destino",
                      hintText: ""),
                      onSaved: (val){
                      setState(() {
                      description = val;
                    });
                  },
//                    validator: (val) => val == "" ? val : null,
                ),
              ),

              Divider(),
              ListTile(
                title: TextFormField(
                  initialValue: widget.record.saldo,
                  autocorrect: true,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Saldo Actual",
                      hintText: ""),
                  onSaved: (val){
                    setState(() {
                      description = val;
                    });
                  },
//                    validator: (val) => val == "" ? val : null,
                ),
              ),


              ListTile(
                title: TextFormField(
                  //initialValue: "",
                  controller:montoTransfercontroller,

                  autocorrect: true,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Monto a Transferir",
                      hintText: ""),
                  onSaved: (val){
                    setState(() {
                      description = val;
                    });
                  },
//                    validator: (val) => val == "" ? val : null,
                ),
              ),

              Divider(),
              buttonSection(this.record),
              Divider(),

              Expanded(
                child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (_, index){
                      return ListTile(
                        title: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.category, color: Colors.green,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
//                                  child: Text("${categoryList[index].category_name}", style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0, ),),
                                  child: Text("${categoryList[index].category_name}", style: TextStyle(color: Colors.orange, fontSize: 20.0, ),),

                                ),
                              ],
                            )),
                        onTap: (){
                          setState(() {
                            categoryToDisplay = categoryList[index].category_name;
                            category = categoryList[index].category_name;
                          });
                        },
                      );
                    }),
              )


            ],
          ),
        ),
      ),

      /*
      floatingActionButton: FloatingActionButton(onPressed: (){
        final FormState form = formkey.currentState;
        if (form.validate()) {
          form.save();
          form.reset();
          addTransaction(income, "income", category: category, description: description);
        }
      }, child: Icon(Icons.add), backgroundColor: Colors.blue.shade900,),
      */
    );




  }


  //final DocumentReference reference;

  Container buttonSection(Record record) {
    print(record.toString());
    Record record2;
    ///record2 = Record.fromSnapshot(data);
    //record2.numeroCuenta=cuentaDestinoController.toString();
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed:() {
          print("Actualizar data");
          record.reference.updateData(<String, dynamic>{
            'saldo': (double.parse(record.saldo)  - double.parse(montoTransfercontroller.text)).toString()
          });

            Firestore.instance.collection('cuentas').where("cuenta",isEqualTo: cuentaDestinoController.text)
                .getDocuments().then((value){
              value.documents.forEach((result) {
                print('ENTROOOO');
                print( result.data);
                print(result.data['saldo']);

                result.reference.updateData(<String, dynamic>{
                  'saldo': (double.parse(result.data['saldo']) + double.parse(montoTransfercontroller.text)).toString()
                });
                /*Firestore.instance.collection('cuentas').document(cuentaDestinoController.text).updateData(<String, dynamic>{
                  'saldo': (double.parse(result.data['saldo']) + double.parse(montoTransfercontroller.text)).toString()
                });*/
              });
            });

          Map<String, dynamic> docData = {
            'cuentaDestino': cuentaDestinoController.text,
            'cuentaOrigen': record.numeroCuenta,
            'cuentapropietaria': record.numeroCuenta,
            'montoTrans': (-1 *double.parse(montoTransfercontroller.text)).toString(),
            'tipo': "retiro",
            "fecha": new DateTime.now(),
          };
          Map<String, dynamic> docData2 = {
            'cuentaDestino': record.numeroCuenta,
            'cuentaOrigen': cuentaDestinoController.text,
            'cuentapropietaria': cuentaDestinoController.text,
            'montoTrans': double.parse(montoTransfercontroller.text).toString(),
            'tipo': "abono",
            "fecha": new DateTime.now(),
          };
          Random aleatorio = new Random();
          int intAletorio = aleatorio.nextInt(963252110);
          int intAletorio2 = aleatorio.nextInt(963252110);
          Firestore.instance.collection('transferencias').document(intAletorio.toString()).setData(docData);
          Firestore.instance.collection('transferencias').document(intAletorio2.toString()).setData(docData2);


          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()),(Route<dynamic> route) => false);

         // Navigator.push(context, MaterialPageRoute(builder: (context) => AddSaldos(record)));

/*
            Firestore.instance.collection('cuentas').document(cuentaDestinoController.text).updateData(<String, dynamic>{
            'saldo': (double.parse(record.saldo) - double.parse(saldoController.text)).toString()
            });
*/
          /*record2.reference.updateData(<String, dynamic>{
            'saldo': (double.parse(record.saldo) + 5).toString()
          });*/
            //Firestore.instance.runTransaction((transaction) async {
            //final freshSnapshot = await transaction.get(record.reference);
            //final fresh = Record.fromSnapshot(freshSnapshot);
            //await transaction.update(record.reference, {'saldo': (double.parse(fresh.saldo) + 5).toString()});
            //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);

          //});





          //cuentaOrigenController.text == "" || cuentaDestinoController.text == "" ? null : () {
          /*setState(() {
            _isLoading = true;
          });*/
          //signIn(emailController.text, passwordController.text);
            },
            elevation: 0.0,
            color: Colors.green,
            child: Text("Transferir", style: TextStyle(color: Colors.white70)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }


    Widget _displaySelectedCategory() {
    if(categoryToDisplay == ""){
      return Container();
    }else{
      return  Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: MaterialButton(
            onPressed: (){
              setState(() {
                categoryToDisplay = "";
                category = "";
              });
            },
            child: Material(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(5.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: new Text(categoryToDisplay, style: TextStyle(color: Colors.white,  fontSize: 18.0),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                    child: new Icon(Icons.close, color: Colors.white, size: 18.0,),
                  )
                ],
              ),
            )),
      );
    }
  }
}

