import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget{
  CustomScaffold({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "images/background.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child!,),
        ],
      ),
    );
  }
}