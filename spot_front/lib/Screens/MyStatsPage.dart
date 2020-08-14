import 'package:flutter/material.dart';
import 'package:spot_front/Screens/MyMindfulPage.dart';

class MyStatsPage extends StatefulWidget {
  @override
  _MyStatsPageState createState() => _MyStatsPageState();
}

class _MyStatsPageState extends State<MyStatsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "My Stats Page"
          ),
        ),
        FloatingActionButton(
          onPressed: () {Navigator.push(context,
    MaterialPageRoute(builder: (context) => MyMindfulPage())
    );
    },
        ),
      ],
    );
  }
}
