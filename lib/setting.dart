import 'package:flutter/material.dart';
import 'package:mysql_flutter/profile.dart';


class setting extends StatelessWidget {
  static String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      drawer: profile(),
    );
  }
}
