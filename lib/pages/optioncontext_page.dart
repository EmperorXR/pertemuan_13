import 'package:flutter/material.dart';
import 'package:pertemuan_13/pages/login_page.dart';
import 'package:pertemuan_13/pages/maps_page.dart';
import 'package:pertemuan_13/pages/media_page.dart';
import 'package:pertemuan_13/pages/profile_page.dart';
import 'package:pertemuan_13/style/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/cupertino.dart';

enum Menu {item1, item2, item3}

class Optioncontext extends StatefulWidget{
  @override
  State<Optioncontext> createState() => _OptioncontextState();
}

class _OptioncontextState extends State<Optioncontext>{
  final List<Widget> _page = [Optioncontext(), MediaPage(), MapsPage()];

  var curentPage = 0;

  Menu? seletedMenu;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Pertemuan 12"),
        actions: [
          PopupMenuButton<Menu>(
            initialValue: seletedMenu,
            onSelected: (Menu item){},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              //Profile
              PopupMenuItem<Menu>(
                value: Menu.item1 ,child: Row(children: [
                  Icon(Icons.person, size: 20),
                  SizedBox(width: 12),
                  Text("Profile")
                ],), 
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),

              //Logout
              PopupMenuItem<Menu>(
                value: Menu.item3 ,child: Row(children: [
                  Icon(Icons.logout, size: 20),
                  SizedBox(width: 12),
                  Text("Logout")
                ],),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(
                      "Logout Success!"
                    ),),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },)
            ],
          ),
        ],
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          //Menu 1
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoContextMenu(
              actions: <Widget>[
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                  child: Text("Copy"),
                ),CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.share,
                  child: Text("Share"),
                ),
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.delete,
                  child: Text("Delete"),
                ),
              ], 
              child: ColoredBox(
                color: CupertinoColors.systemYellow,
                child: FlutterLogo(size: 500),
              ),
            ),
          ),

          //Menu 2
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoContextMenu(
              actions: <Widget>[
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                  child: Text("Copy"),
                ),CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.share,
                  child: Text("Share"),
                ),
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.delete,
                  child: Text("Delete"),
                ),
              ], 
              child: ColoredBox(
                color: CupertinoColors.systemYellow,
                child: FlutterLogo(size: 500),
              ),
            ),
          ),

          //Menu 3
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoContextMenu(
              actions: <Widget>[
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                  child: Text("Copy"),
                ),CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.share,
                  child: Text("Share"),
                ),
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.delete,
                  child: Text("Delete"),
                ),
              ], 
              child: ColoredBox(
                color: CupertinoColors.systemYellow,
                child: FlutterLogo(size: 500),
              ),
            ),
          ),

          //Menu 4
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoContextMenu(
              actions: <Widget>[
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                  child: Text("Copy"),
                ),CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.share,
                  child: Text("Share"),
                ),
                CupertinoContextMenuAction(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.delete,
                  child: Text("Delete"),
                ),
              ], 
              child: ColoredBox(
                color: CupertinoColors.systemYellow,
                child: FlutterLogo(size: 500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}