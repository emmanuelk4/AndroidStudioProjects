//3d Drawer Screen
//Stateless coz nothing changes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbanbliss/Pages/DrawerView.dart';
import 'package:urbanbliss/Pages/HomePage.dart';
import 'package:urbanbliss/Pages/Shop.dart';
import 'package:urbanbliss/Pages/Chat.dart';
import 'package:urbanbliss/blocNav/blocNavigation.dart';


class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(HomePage()),
      child: Stack(
        children: <Widget>[
          BlocBuilder<NavigationBloc, NavigationStates>(
            builder: (context, navigationState){
              return navigationState as Widget;
            },
          ),
          DrawerView(),
        ],
      ),

    ),
    );

}
}

