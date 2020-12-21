import 'package:flutter/material.dart';
import 'package:mysql_flutter/profile.dart';

 class userProfile extends StatelessWidget {
  static String routename = "/userProfile";



   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
       title: Text('UserDetais'),
      ),
      drawer: profile(),
      body: Center(

      ),

     );
   }
 }

