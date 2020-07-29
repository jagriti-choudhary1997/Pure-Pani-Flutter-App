import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/WLogin.dart';
import 'WDashboard.dart';
import 'WLogin.dart';

class AuthService{
  
  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData)
        {
          return DashboardScreen();
        }
        else{
          return Login();
        }
      },
    );
  }
   signOut(){
    FirebaseAuth.instance.signOut();
  }
  login(AuthCredential authCredential){
   FirebaseAuth.instance.signInWithCredential(authCredential);
 }
}