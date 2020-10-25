import 'package:flutter/material.dart';

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
                icon: const Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'Please enter some text';
                }
                return null;

              }

          ),


          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
          ),


          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.mobile_friendly),
              hintText: 'Enter your Mobile Number',
              labelText: 'Mobile',
            ),
          ),

          TextFormField(
            decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_return_sharp),
                hintText: 'Enter Address',
                labelText: "Address"

            ),),









          new Container(
              padding: const EdgeInsets.all(20.0),
              child: new MaterialButton(
                  child:  Text('Submit',style:TextStyle(fontSize: 25,fontWeight: FontWeight.normal)

                  ),

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