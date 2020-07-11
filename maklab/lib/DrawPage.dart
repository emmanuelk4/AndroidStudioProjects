import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEEEE),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "Mak's Lab",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        leading: IconButton(
          onPressed: (){} ,
          icon: Icon(Feather.camera, color: Colors.black,),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon:Icon(Feather.tv, color: Colors.black),
          ),
          IconButton(
            onPressed: (){},
            icon:Icon(FontAwesome.send_o, color: Colors.black),
          ),
        ],
      ),

    );
  }
}
