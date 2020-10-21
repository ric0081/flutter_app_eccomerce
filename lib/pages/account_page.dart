import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _currentStep=0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Registro'),
          backgroundColor: Colors.orange,
        ),

        body:
        Column(children: <Widget>[
          Expanded(
                child:
             Stepper(
           //     style:Theme.of(context).textTheme.headline1,
                steps: _mySteps(),
                type: StepperType.horizontal,
                currentStep: this._currentStep,
                onStepTapped: (step){
                  setState(() {
                    this._currentStep=step;
                  });
                  },
              onStepContinue: (){
                setState(() {
                  if(this._currentStep<this._mySteps().length-1){
                    this._currentStep=this._currentStep+1;
                  }else{
                    print('Completo registro');

                  }
                });
              },

              onStepCancel: (){
                setState(() {
                  if(this._currentStep>0){
                    this._currentStep=this._currentStep-1;
                  }else{
                    this._currentStep=0;
                  }
                });
              },



            ),
          ),
        ]));
  }

  List<Step> _mySteps() {
    List<Step> steps = [
      Step(
        title: const Text('Datos nuevo Usuario'),
        isActive: _currentStep>=0,
        state: StepState.complete,
//        isActive:_currentStep>=0,
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ],
        ),
      ),
      Step(
        isActive: _currentStep>=1,
//        isActive: false,
        state: StepState.editing,
        title: const Text('Address'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Home Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Postcode'),
            ),
          ],
        ),
      ),

      Step(
        isActive: _currentStep>=2,
//        isActive: false,
        state: StepState.editing,
        title: const Text('Address 2'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Home Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Postcode'),
            ),
          ],
        ),
      ),

      /*Step(

        state: StepState.error,
        title: const Text('Avatar'),
        subtitle: const Text("Error!"),
        content: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.red,
            )
          ],
        ),
      ),*/
    ];
    return steps;
    }

}