import 'package:flutter/material.dart';
import 'package:pertemuan_13/component/musicplayer.dart';
import 'package:pertemuan_13/component/videoplayer.dart';
import 'package:pertemuan_13/pages/login_page.dart';
import 'package:pertemuan_13/pages/maps_page.dart';
import 'package:pertemuan_13/pages/optioncontext_page.dart';
import 'package:pertemuan_13/pages/profile_page.dart';

enum Menu{item1, item2, item3}

class MediaPage extends StatefulWidget{
  MediaPage({super.key});

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage>{
  final List<Widget> _page = [Optioncontext(), MediaPage(), MapsPage()];

  var currentPage = 0;

  Menu? seletedMenu;

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      initialIndex: 1,
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Pertemuan 13"),
          actions: [
            PopupMenuButton<Menu>(
                initialValue: seletedMenu,
                onSelected: (Menu item){},
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                  //Profile
                  PopupMenuItem<Menu>(
                    value: Menu.item1,
                      child: Row(
                        children: [
                          Icon(Icons.person, size: 20),
                          SizedBox(width: 12),
                          Text("Profile")
                        ],
                      ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                  ),
                  //Logout
                  PopupMenuItem<Menu>(
                    value: Menu.item2,
                      child: Row(
                        children: [
                          Icon(Icons.logout, size: 20),
                          SizedBox(width: 12),
                          Text("Logout")
                        ],
                      ),
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(
                          "Logout Success!"
                        ),),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),

                ],),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.headphones)),
              Tab(icon: Icon(Icons.movie)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MusicplayerappPage(),
            VideoplayerappPage(),
          ]),
      )
    );
  }
}