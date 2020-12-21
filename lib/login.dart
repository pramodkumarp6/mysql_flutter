import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysql_flutter/dashboard.dart';
import 'package:mysql_flutter/profile.dart';

import 'register.dart';


import 'package:http/http.dart' as http;


class login extends StatelessWidget {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

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

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();








  Future sign() async {


 var url ="https://pramodkumarp6.000webhostapp.com/api/public/login";
 print(email);
 print(pass);

  var response =await http.post(url,body: {

    "email": email.text,
    "password": pass.text,


  });

 var data = json.decode(response.body);

          bool  d= data["error"];
          var  ds= data["id"];


          bool b =false ;
 if(b == d) {
   //Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));

   //SharedPreferences prefs = await SharedPreferences.getInstance();

 }else{
   Fluttertoast.showToast(msg:   data["message"], toastLength: Toast.LENGTH_SHORT);
 }





  }

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

            controller: email,



            /*validator: (value){
              if(value.isEmpty){
                return 'Please enter some text';
              }
              return null;

            }*/
          ),



          TextFormField(
              obscureText: true,

              obscuringCharacter: "*",
            decoration: const InputDecoration(
              icon: const Icon(Icons.lock),

              hintText: 'Enter a Password number',
              labelText: 'Password',

            ),
              controller: pass



          /* validator: (value){
              if(value.isEmpty){
                return "Please enter Password";
              }

            }*/
          ),







          new Container(
             margin:  EdgeInsets.all(10.0),
              child: new RaisedButton(
                child:  Text('Submit'),
                  color: Colors.blueAccent,

                  textColor: Colors.white,
                  onPressed: (){
                  if(_formKey.currentState.validate()){

                    sign();

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
              padding: EdgeInsets.only(left: 10.5,right: 1.0) ,
            child: new RaisedButton(
              child: Text('ForgetUser'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> dashboard(),
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

