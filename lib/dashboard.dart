import 'package:flutter/material.dart';
import 'package:mysql_flutter/profile.dart';

class dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home '),
      ),
      drawer: profile(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("we are in Home page")
          ],
          
        ),
      ),

    );

  }

}