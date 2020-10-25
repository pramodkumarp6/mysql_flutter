import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'forgetuser.dart';
import 'register.dart';
class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),

        body: MyCustomForm(),
      ),
    );
  }
}
// Create a Form widget.
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
              hintText: 'Enter your name',
              labelText: 'Email',

            ),
            validator: (value){
              if(value.isEmpty){
                return 'Please enter some text';
              }
              return null;

            }

          ),


          TextFormField(
              obscureText: true,

              obscuringCharacter: "*",
            decoration: const InputDecoration(
              icon: const Icon(Icons.lock),

              hintText: 'Enter a Password number',
              labelText: 'Password',

            ),
            validator: (value){
              if(value.isEmpty){
                return "Please enter Password";
              }

            }
          ),







          new Container(
              padding: const EdgeInsets.only(left: 40.0, top: 50.0),
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


          new Container(
            padding:  EdgeInsets.only(left: 250.0, top:100),
            child: new RaisedButton(
            child: const Text('Register'),
               color: Colors.green,
               textColor: Colors.white,
               onPressed: () {

                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => register(),
                   ),
                 );

               }

          )

          ),
          new Container(
              padding: EdgeInsets.all(20.5) ,
            child: new RaisedButton(
              child: Text('ForgetUser'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> forgetuser(),
                ),
                );
              }

            ),

          )





        ],
      ),
    );
  }
}