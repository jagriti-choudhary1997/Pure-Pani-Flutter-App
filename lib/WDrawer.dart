import 'package:flutter/material.dart';
import 'package:flutter_dev/WDashboard.dart';
import 'package:flutter_dev/authservice.dart';
import 'WLogin.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {

  int index=0;
  List<Widget> listWidgets=[
   Dashboard(),
   Login(),
  ];
  Function onTap;
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: 'My login Page',
      home: DrawerContent(onTap: (ctx,i){
        setState(() {
          index=i;
          Navigator.pop(context);
        });
      }),
      
    );
  }
}
class DrawerContent extends StatelessWidget {

  final Function onTap;

  DrawerContent({this.onTap});
   @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              color: Colors.blue,
              child: Text(
                'Pure Pani', 
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
                 color: Colors.black87,
                ), 
              ),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(Icons.add_to_home_screen),
              title: Text(
                'Dash-Board',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
              onTap: (){
              //onTap(context,0);
               Navigator.pop(context, '/dashboard');
              },
            ),
            Divider(height: 1,),
             ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Log-out',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
              onTap: (){
               // onTap(context,1);
               AuthService().signOut();
              //  Navigator.push(context, MaterialPageRoute(
              //    builder: (_){
              //      return Login();
              //    }));
              Navigator.pop(context, '/login');
              },
            ),
          ],
        ),
      );
  }
}