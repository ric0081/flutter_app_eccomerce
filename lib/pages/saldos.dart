import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_eccomerce/pages/home.dart';


class AddSaldos extends StatefulWidget {
  AddSaldos(this.recordOrigen);
  Record recordOrigen;
    @override
  _AddSaldosState createState() => _AddSaldosState();
}

class _AddSaldosState extends State<AddSaldos> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  Stream<QuerySnapshot> _queryTrans;
  List<Choice> choices = const <Choice>[
    const Choice(title: "Transferir", icon: Icons.attach_money),
    const Choice(title: "Saldo", icon: Icons.money_off),
    const Choice(title: "Pagar", icon: Icons.category)
  ];
  double totalIncome = 0.0;
  double totalExpense = 0.0;
  String currentBalance = "";
  String spentSoFar = "";
  Record recordOrigen;

  @override
  void initState() {
    super.initState();
    recordOrigen = widget.recordOrigen;
    String a=recordOrigen.numeroCuenta;
     print("llega$a");
    _queryTrans = Firestore.instance.collection('transferencias').where("cuentapropietaria", isEqualTo: recordOrigen.numeroCuenta).orderBy("fecha",descending: true).snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () {
          Navigator.pop(context);
        }),
        title: new Text("Movimientos"),
        backgroundColor: Colors.orange,
        centerTitle: false,
        elevation: 1.0,
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
                      onTap: () {},
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
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text("developed by: Ricardo Eneque",
                  style: TextStyle(color: Colors.grey),),
              )
            ],
          ),
        ),
      ),


        body:_buildB(context),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[

            Expanded(
              child: ListTile(
                title: new Text("Cuenta:"),
                subtitle: _viewBalance(),
              ),
            ),

            Expanded(
              child: ListTile(
                title: new Text("Saldo:"),
                subtitle: _viewExpence(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: MaterialButton(
                  onPressed: (){
                    //_alertDialogs.summaryAlert(context);
                  },
                  child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                        child: new Text("Detalle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ))),
            ),


          ],
        ),
      ),

    );
  }
  Widget _subtitulo(BuildContext context) {
    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Container(
              child: ListTile(
              title: Text("Mi Cuenta"),

    )));
    }

  Widget _buildB(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _queryTrans,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildLi(context, snapshot.data.documents);
      },
    );
  }


  Widget _buildLi(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListI(context, data))
          .toList(),
    );
  }

  Widget _buildListI(BuildContext context, DocumentSnapshot data) {
    final listadoTransferencia = ListadoTransferencia.fromSnapshot(data);
    print("transferencia");

    print(listadoTransferencia);
    return Padding(
      key: ValueKey(listadoTransferencia.tipo),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
            //title: Text(listadoTransferencia.tipo),
            title: Text("Tranfer Web/app", style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            )),
            subtitle: Text(listadoTransferencia.tipo),
            leading: Icon(Icons.playlist_add_check, size: 40.0, color: Colors.green,),
            trailing: Wrap(
                children: <Widget>[
                  //Icon(Icons.flight),
                  Icon(Icons.attach_money, color: Colors.green,size: 18.0),
                  //$listadoTransferencia.montoTransferencia"
                  Text(listadoTransferencia.montoTransferencia, style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                      color: Colors.green
                  ),)
                ]),

            //trailing: Text(''+record.saldo.toString()),
            /*trailing:
            new Column(
              children: <Widget>[
                PopupMenuButton<Choice>(
                  //icon: Icon(Icons.more_vert),
                  //text:Text(""),
                  //child: ListTile(title: Text("a")),
                  onSelected: (Choice choice) {
                    renderizar(choice, listadoTransferencia);
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


              ],
            ),
            */
            onTap: () {
            }
        ),
      ),
    );
  }

  Widget _viewBalance() {
    if(totalExpense > totalIncome){
      return new Text("You have negative balance", style: TextStyle(color: Colors.red, fontSize: 16.0),);

    }else{
      currentBalance=this.recordOrigen.numeroCuenta;
      return  new Text(currentBalance, style: TextStyle(color: Colors.green, fontSize: 12.0, fontWeight: FontWeight.bold),);

    }
  }

  Widget _viewExpence() {
    spentSoFar=this.recordOrigen.saldo;
    return  new Text("\$$spentSoFar", style: TextStyle(color: Colors.orange, fontSize: 12.0, fontWeight: FontWeight.bold),);
  }




  Container buttonSection(ListadoTransferencia listadoTransferencia) {
    print(listadoTransferencia.toString());
    ListadoTransferencia record2;
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

        },
        elevation: 0.0,
        color: Colors.green,
        child: Text("Transferir", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }



}
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

  void renderizar(Choice choice, ListadoTransferencia campos) {
    if (choice.title == "Transferir") {
      //  Navigator.push(context,
      //    MaterialPageRoute(builder: (context) => AddIncome(campos)));
    } else if (choice.title == "Saldo") {
      //Navigator.push(context,
        ///  MaterialPageRoute(builder: (context) => AddSaldos(campos)));
    } else if (choice.title == "Pagar") {
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewIncome()));
      /*   }else if (choice.title == "view expenses") {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseView()));
        }else if (choice.title == "add category") {
           _alertDialogs.showCategoryAlert(_categoryController);
          */
    }
  }




//this will be the choices class
  class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
  }


  class ListadoTransferencia {
  final String cuentaDestino;
  final String cuentaOrigen;
  final String cuentaPropietaria;
  final String montoTransferencia;
  final String tipo;
  final DocumentReference reference;

  ListadoTransferencia.fromMap(Map<String, dynamic> map, {this.reference})
  : assert(map['cuentaDestino'] != null),
  assert(map['cuentaOrigen'] != null),
  assert(map['cuentapropietaria'] != null),
  assert(map['montoTrans'] != null),
  assert(map['tipo'] != null

  ),

  cuentaDestino = map['cuentaDestino'],
        cuentaOrigen = map['cuentaOrigen'],
        cuentaPropietaria = map['cuentapropietaria'],
        montoTransferencia = map['montoTrans'],
        tipo = map['tipo']
  ;

  ListadoTransferencia.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Transferencia<$cuentaDestino:$cuentaPropietaria>";
  }




