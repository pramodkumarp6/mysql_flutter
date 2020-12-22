import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
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
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();




      Future register() async{
        var url="http://192.168.43.200/retrofit/public/register";

        var response =await http.post(url,body: {

          "email": email.text,
          "password": password.text,
          "name": name.text,
          "gender": gender.text


        });

       var data =jsonDecode(response.body);


        Fluttertoast.showToast(msg:   data["message"], toastLength: Toast.LENGTH_SHORT);




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
                icon: const Icon(Icons.person),
                hintText: 'Enter your name',

                labelText: 'Name',
              ),
            controller: name,
               validator: (value){
                if(value.isEmpty){
                  return 'Please Enter Name';
                }
                return null;
               }

          ),


          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'email',
            ),
            controller: email,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter the Email';
              }
              return null;
            }

          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your Password',
              labelText: 'Password',
            ),
              controller: password,
              validator:(value){
                if(value.isEmpty){
                  return 'Please enter Password';
                }
                return null;
              }
          ),



          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.mobile_friendly),
              hintText: 'Enter your Gender Number',
              labelText: 'gender',
            ),
            controller: gender,
            validator: (value){
              if(value.isEmpty){
                return'Please Enter Gender';
              }
              return null;
            }


          ),










          new Container(
              padding: const EdgeInsets.only(left: 150.5,right: 100.5),
              child: new RaisedButton(
                  child: const Text('Submit'),

                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: (){


                    if(_formKey.currentState.validate()){

                      register();
                    }







                    }



              )),




        ],
      ),
    );
  }
}

