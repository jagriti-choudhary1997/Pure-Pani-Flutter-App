import 'package:flutter/material.dart';
//import 'package:flutter_dev/authservice.dart';
import 'WSignUp.dart';
import 'WOTP.dart';
import 'WDashboard.dart';
import 'WLogin.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: 'My login Page',
   home: LoginPage(),
     //home: AuthService().handleAuth(),
      routes: {
        '/sign-up' : (context) => SignUp(),
        '/login' : (context)=> LoginPage(),
       '/otp' : (context)=> OTPPage(),
        '/dashboard':(context)=> Dashboard(),
      },
    );
  }
}
class LoginPage extends StatefulWidget {
  @override 
  _LoginPageState createState()=> _LoginPageState();
}
class _LoginPageState extends State<LoginPage>
{
  List<Map<int, String>> userInfo=[{
   9516053978: 'jag123',
  }];
  
    
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children:<Widget>[
          Image.asset(
            'assets/images/bglogin.png',
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
             
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                    height:450,
                    width: 380,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Login(),
                  ),
                  ),
                  
                ],
              ),
              
            ],
          )
        ],
      ),
        
    );
  }
}
 
  
