import 'package:flutter/material.dart';
import 'package:mysql_flutter/setting.dart';
import 'package:mysql_flutter/userProfile.dart';



class profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(35),
            color: Theme.of(context).primaryColor,

            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage('https://picsum.photos/250?image=9'),
                          fit:BoxFit.fill
                      ),

                    ),
                  ),
                  Text('PRAMOD KUMAR',style: TextStyle(fontSize: 22,color: Colors.white
                  ),
                  ),

                  Text('pramodkumarp6@gmail.com',style: TextStyle( color: Colors.white),),


                ],
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile',style: TextStyle(fontSize:18,
            ),
            ),
            onTap: () {
                Navigator.of(context).pushNamed(userProfile.routename);
            },
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting',style: TextStyle(fontSize:18,
            ),
            ),
            onTap: (){
              Navigator.of(context).pushNamed(setting.routeName);

            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_back,),
            title: Text('Logout',style: TextStyle(fontSize:18,
            ),
            ),
            onTap: null,
          ),



        ],
      )








    );
  }
}