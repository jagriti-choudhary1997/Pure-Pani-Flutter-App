import 'package:flutter/material.dart';
//import 'package:flutter_dev/WOTP.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final passwordValidator = MultiValidator([  
    RequiredValidator(errorText: 'password is required'),  
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),  
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')  
 ]);

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  final userNameController= TextEditingController();
  final mobileController= TextEditingController();
  final passwordController= TextEditingController();
  void validate(){
    if(formKey1.currentState.validate())
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 30,
                      ),
                      height: 490,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Form(
                        key: formKey1,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(
                            top:3,
                          ),
                          child: Text(
                            'Sign Up',
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                             ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                            vertical: 10,
                            ),
                            child: TextFormField(
                              controller: userNameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                              onSaved: (String value) => validate,
                              validator: (val) 
                              {
                                if(val.isEmpty)
                                {
                                  return 'Name is required';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                          vertical:10.0,
                          ),
                        
                         child: TextFormField(
                           controller: mobileController,
                              keyboardType: TextInputType.phone ,
                              decoration: InputDecoration(
                                labelText: 'Mobile No.',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                              onSaved: (String value) => validate,
                              validator: (val) 
                              {
                                if(val.isEmpty)
                                {
                                  return 'this is required field';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                          vertical:15.0,
                          ),
                        
                         child: TextFormField(
                           controller: passwordController,
                              autocorrect: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                              onSaved: (String value) => validate,
                              validator: passwordValidator,
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
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                            ),
                           onPressed: (){
                            //  if(userNameController==null || passwordController==null|| mobileController==null)
                            //  {
                            //    validate();
                            //  }
                            //  else if(passwordController!=null)
                            //  {
                            //    validate();
                            //  }
                            //  else if(userNameController!=null && passwordController!=null && mobileController!=null)
                            //  {
                               Navigator.pushNamed(context, '/otp');
                           //  }
                             
                            },
                          splashColor: Colors.blueGrey,
                          ),
                        SizedBox(height: 15),
                        Text("Already have an account?"),
                        SizedBox(height: 10),
                        FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context,'/login');
                          }, 
                          child: Text(
                           "Login",
                           style: TextStyle(
                             color: Colors.blue,
                           ),),
                          ),
                        ],
                      ),
                     ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}