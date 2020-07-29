import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int _otpCodeLength = 6;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
  }

  /// get signature code
  _getSignatureCode() async {
    String signature = await SmsRetrieved.getAppSignature();
    print("signature $signature");
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Verification OTP Code $_otpCode Success")));
    });
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
                    vertical: 25,
                    horizontal: 30,
                  ),
                  height: 300,
                  width: 380,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.8),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                            padding: EdgeInsets.only(
                            top:5,
                            ),
                          child: Text(
                            'OTP',
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                             ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextFieldPin(
                                        filled: true,
                                        filledColor: Colors.grey,
                                        codeLength: _otpCodeLength,
                                        boxSize: 35,
                                        filledAfterTextChange: false,
                                        textStyle: TextStyle(fontSize: 16),
                                        borderStyle: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(34)),
                                        onOtpCallback: (code, isAutofill) =>
                                       _onOtpCallBack(code, isAutofill),
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        child: MaterialButton(
                                        onPressed: _enableButton ? _onSubmitOtp : null,
                                        child: _setUpButtonChild(),
                                        color: Colors.blue,
                                        disabledColor: Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                 ),
                                ),
                              ],
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
  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: TextStyle(color: Colors.white),
      );
    }
    }
}

