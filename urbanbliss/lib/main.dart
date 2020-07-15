import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbanbliss/DrawerLayout.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban bliss',
      theme: ThemeData(
        primaryColor: Color(0xFFFF0000),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.oxygenTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: DrawerLayout(),
    );
  }
}
