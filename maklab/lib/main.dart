      import 'package:flutter/cupertino.dart';
      import 'package:flutter/material.dart';
      import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'DrawPage.dart';
import 'HomePage.dart';

      void main() {
        runApp(MyApp());
      }
      class MyApp extends StatelessWidget{
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: _BottomNav(),

          );
        }
      }
      class _BottomNav extends StatefulWidget {
        @override
        __BottomNavState createState() => __BottomNavState();
      }

      class __BottomNavState extends State<_BottomNav> {
        int _page = 0;
        final List<Widget> navChildren = [
          HomePage(), DrawPage(),
        ];

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            body: IndexedStack(
                children :<Widget>[
                  navChildren[_page]
                ] ),            bottomNavigationBar: CurvedNavigationBar(
              height: 50,
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.black,
              items: <Widget>[
                Icon(Icons.add,
                  size: 15,
                  color: Colors.black,),
                Icon(Icons.list,
                  size: 15,
                  color: Colors.black, ),

              ],
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              animationDuration: Duration(
                  milliseconds: 400
              ),
              animationCurve: Curves.bounceIn,
            ),
          );
        }
      }



