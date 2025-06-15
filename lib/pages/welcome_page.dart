import 'package:flutter/material.dart';
import 'package:pertemuan_13/pages/login_page.dart';
import 'package:pertemuan_13/pages/register_page.dart';
import 'package:pertemuan_13/style/color.dart';

class WelcomePage extends StatelessWidget{
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: backgroundColor1,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: primaryColor,
                  image: DecorationImage(
                    image: AssetImage("images/office.png"))
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.55,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Discover yout\nDreams here",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: textColor1,
                        height: 1.2
                      ),
                    ),

                    SizedBox(height: 20),
                    Text(
                      "Explore all the most exiting dreams based on your interest and study major",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor2
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: backgroundColor3.withOpacity(0.9),
                          border: Border.all(color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, -1),
                            ),
                          ],
                        ),

                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: size.height * 0.08,
                                  width: size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                                    },
                                    child: Center(
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: textColor1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: textColor1
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),),
                        ),
                      ),)
                  ],
                ),
              ))
          ],
        ),
      ),
    );
  }
}