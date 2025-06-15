import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pertemuan_13/pages/login_page.dart';
import 'package:pertemuan_13/style/color.dart';
import 'package:pertemuan_13/widget/custom_scaffold.dart';

class ForgetPassword extends StatefulWidget{
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>{
  
  final _formForgotKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context){
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 10
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formForgotKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color: primaryColor,
                        ),
                      ),

                      SizedBox(height: 40),
                      //New Password
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please new enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("New Password"),
                          hintText: 'Enter New Password',
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),

                      //Confirm New Password
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter confirm new Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("Confirm New Password"),
                          hintText: 'Enter Confirm New Password',
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(height: 25),

                      //button reset password
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formForgotKey.currentState!.validate() && agreePersonalData){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Reset Password Success!'),
                                ),
                              );
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            } else if (!agreePersonalData){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please agree to the processing of personal data'),
                                ),
                              );
                            }
                          }, 
                          child: Text('Reset Password'),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )),
              ),
            ))
        ],
      ),
    );
  }
}