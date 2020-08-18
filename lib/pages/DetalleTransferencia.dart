import 'package:flutter/material.dart';


  class DetalleTransferencia extends StatelessWidget {
      final int index;
      DetalleTransferencia (this.index);

      @override
      Widget build(BuildContext context) {
        return Scaffold (
              appBar: AppBar(
                  title:Text('Realizar transferencia'),
                centerTitle: false,
                elevation: 1.0,
                backgroundColor: Colors.blue.shade900,

              ),
              body: Center(
                  child: Text('ingrese los datos de la cuenta a la que transferira.$index'),
              ),

        );

      }


  }
