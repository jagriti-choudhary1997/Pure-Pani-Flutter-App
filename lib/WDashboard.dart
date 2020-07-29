import 'package:flutter/material.dart';
import 'package:flutter_dev/WDrawer.dart';
import 'WLogin.dart';
import 'WSignUp.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: MyDashboard(),
      
    );
  }
}
class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int index=0;
  List<Widget> listWidgets=[
   Login(),
   SignUp(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pure Pani',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      
      ),
      drawer: DrawerContent(),
     
     body: DashboardScreen(),
    
    );
  }
}
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen>{
  
  @override
  Widget build(BuildContext context) {
  
  return Stack(
        fit: StackFit.expand,
        children:<Widget>[
         // Opacity(opacity: 0.9),
          Image.asset(
            'assets/images/bglogin.png',
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
        Container(
      padding: EdgeInsets.all(25),
      height: 300,
      width: 300,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 200,
            width: 360,
            decoration: BoxDecoration(
               color: Colors.white,
            ),
            child: Image.asset(
              'assets/images/purepanilogo.png',
              height: 100,
            ),
          ),
          Divider(height: 20,),
          Container(
            height: 360,
            width: 360,
            decoration: BoxDecoration(
            color: Colors.white,
            ),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: <Widget>[
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/group.webp',
                      height: 50,
                    ),
                    Text('Group'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/users.webp',
                      height: 50,
                    ),
                    Text('Customers'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/delivery.webp',
                      height: 50,
                    ),
                    Text('Delivery'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/invoice.webp',
                      height: 50,
                    ),
                    Text('Invoice'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/inventory.png',
                      height: 50,
                    ),
                    Text('Inventory'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/employee.webp',
                      height: 50,
                    ),
                    Text('Employee'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/holiday.webp',
                      height: 50,
                    ),
                    Text('Leaves'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/support.webp',
                      height: 50,
                    ),
                    Text('Support'),
                   ],
                  ),
                ),
                Card(
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[ Image.asset (
                      'assets/images/reports.webp',
                      height: 50,
                    ),
                    Text('Report'),
                   ],
                  ),
                ),
              ],
            ),
          ),
          
       ],
      ),
      ),
    ],
        
    );
  }
}
