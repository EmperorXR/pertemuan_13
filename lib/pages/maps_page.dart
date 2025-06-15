import 'package:flutter/material.dart';
import 'package:pertemuan_13/pages/media_page.dart';
import 'package:pertemuan_13/pages/optioncontext_page.dart';

class MapsPage extends StatefulWidget{
  MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>{
  final List<Widget> _page = [Optioncontext(), MediaPage(), MapsPage()];

  var curentPage = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Pertemuan 14"),
      ),
      body: Center(
        child: Text("Not Found 404",
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),),
      ),
    );
  }
}