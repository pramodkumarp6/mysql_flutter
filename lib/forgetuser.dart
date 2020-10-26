import 'package:flutter/material.dart';

import 'main.dart';

class forgetuser extends StatefulWidget{
  @override
  _forgetuserState createState() => _forgetuserState();
  }

class _forgetuserState extends State<forgetuser>{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     theme : ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Forget User"),
        ),

        body: MyCustomForm(),
      ),
    );
  }
}
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Enter your Email',
                labelText: 'Email',

              ),


              validator: (value){
                if(value.isEmpty){
                  return 'Please enter Email';
                }
                return null;

              }

          ),











          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 50.0),
              child: new RaisedButton(
                  child: const Text('Submit'),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content:Text('Data is Over')));
                    }

                  }

              )),






        ],
      ),
    );
  }
}
