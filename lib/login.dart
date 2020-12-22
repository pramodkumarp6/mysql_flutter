import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysql_flutter/dashboard.dart';
import 'package:http_auth/http_auth.dart';
import 'package:mysql_flutter/services/appUrl.dart';
import 'package:mysql_flutter/splash.dart';
import 'package:http/http.dart';



import 'register.dart';


import 'package:http/http.dart' as http;


class login extends StatelessWidget {

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
          resizeToAvoidBottomPadding: false
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
  TextEditingController password = TextEditingController();

   sign() async {

     Map headers = {
       'content-type': 'application/json',
       'accept': 'application/json'
      // 'authorization': basicAuth
     };


     var response =await http.post(AppUrl.login, body: {

    'email': email.text,
    'password': password.text
  });

 var data = json.decode(response.body);
        int   status = data['status'];


        if(status == 200) {

 Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard()));

   //SharedPreferences prefs = await SharedPreferences.getInstance();

 }else{
       Fluttertoast.showToast(msg:  data['message'], toastLength: Toast.LENGTH_SHORT);

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


/*
            validator: (value){
              if(value.isEmpty){
                return 'Please enter Email';
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
              controller: password,



         /* validator: (value){
              if(value.isEmpty){
                return 'Please enter Password';
              }
              return null;
            }*/
          ),







          new Container(
             margin:  EdgeInsets.all(50.10),
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
            padding:  EdgeInsets.only(left: 25.0, top:10),
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
              padding: EdgeInsets.only(left: 5.5,right: 1.0) ,
            child: new RaisedButton(
              child: Text('ForgetUser'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> splash(),

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

