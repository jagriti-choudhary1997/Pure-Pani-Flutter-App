//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dev/authservice.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final requiredValidator = RequiredValidator(errorText: 'this field is required');  
   
  final mobileController= TextEditingController();
  final passwordController= TextEditingController();
  final int mobno= 9516053978;
  final pswd='jag@131211';
  void validation(){
    if(formKey.currentState.validate())
    {
      print('OK');
    }
    else
    {
      print('Error');
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Form(
                      key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(
                            top:5,
                          ),
                          child: Text(
                            'Login',
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                             ),
                            ),
                          ),
                        Padding(padding: EdgeInsets.symmetric(
                          vertical:15.0,
                        ),
                        
                        child: TextFormField(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          autocorrect: true,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            labelText : 'Mobile No.',
                            labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.0,
                            ),
                            contentPadding: EdgeInsets.all(10),
                          ),
                          onSaved: (String value) {
                            validation();
                            
                            },
                            // onChanged: (val){
                            //   setState(() {
                            //    // this.phoneNo=val;
                            
                            //   });
                            // },
                          validator: MultiValidator(
                            [
                              requiredValidator,
                            ],
                          ),
                        ),
                        ),
                        
                        TextFormField(
                          controller: passwordController,
                          autocorrect: false,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                      
                          decoration: InputDecoration(
                            labelText: 'Pass Word',
                            labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.0,
                            ),
                            contentPadding: EdgeInsets.all(10),
                          ),
                          // onChanged: (val1){
                          //   setState(() {
                          //     //this.password=val1;
                          //   });
                          // },
                          onSaved: (String value) => validation,
                          validator: requiredValidator ,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0,bottom: 8.0),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: <Widget>[
                          FlatButton(
                          onPressed: (){}, 
                          child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              ),
                          ),
                          ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 200.0,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                            ),
                          
                          onPressed: (){
                            
                           if(mobileController!=null && passwordController!=null && mobileController.text== '9516053978' && passwordController.text=='jag@131211')
                            {
                              Navigator.pushNamed(context, '/dashboard');
                            } 
                            else{
                              int i=0;
                              if(i==0)
                              {
                              validation();
                              }
                              else{
                                Navigator.pushNamed(context, '/login');
                              }
                            }
                          
                            },
                          splashColor: Colors.blueGrey,
                          ),
                        SizedBox(height: 15),
                        Text("Don't have an account?"),
                        SizedBox(height: 10),
                        FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context,'/sign-up');
                          }, 
                          child: Text(
                           "Sign up",
                           style: TextStyle(
                             color: Colors.blue,
                           ),),
                          ),
                         
                      ],
                    ),
                    );
  }
}