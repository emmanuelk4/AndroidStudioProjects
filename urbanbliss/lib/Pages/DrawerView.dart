import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:urbanbliss/Pages/MenuItem.dart';
import 'package:urbanbliss/blocNav/blocNavigation.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> with SingleTickerProviderStateMixin<DrawerView> {
  AnimationController _animationController;
  StreamController<bool> isDrawerOpenedStreamController;
  Stream<bool> isDrawerOpenedStream;
  StreamSink<bool> isDrawerOpenedSink;

  final _animationDuration = const Duration(milliseconds: 500);


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isDrawerOpenedStreamController = PublishSubject<bool>();
    isDrawerOpenedStream = isDrawerOpenedStreamController.stream;
    isDrawerOpenedSink = isDrawerOpenedStreamController.sink;

  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    isDrawerOpenedStreamController.close();
    isDrawerOpenedSink.close();
  }
  void onDrawerIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus==AnimationStatus.completed;
    if(isAnimationCompleted) {
      isDrawerOpenedSink.add(false);
    _animationController.reverse();
    }else{
      isDrawerOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isDrawerOpenedStream,
      builder: (context, isDrawerOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isDrawerOpenedAsync.data ? 0 : -screenWidth,
          right: isDrawerOpenedAsync.data ? 0 : screenWidth -45,
          child: SizedBox(
            width: screenWidth,
            child: Row(//Put in a row to make it seem like cropped sidebar
                children: <Widget> [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: const Color(0xFF262AAA),
                      child: Column(
                        children: <Widget> [
                          SizedBox(
                            height: 100,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.perm_identity,
                                color: Colors.white
                              ),
                            ),
                            title: Text(
                              "Murage",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            subtitle: Text(
                              "You are Beautiful!",
                              style: TextStyle(
                                color: Color(0xFF1BB5FD),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Divider(
                            height: 64,
                              thickness: 0.5,
                            color:  Colors.white.withOpacity(0.3),
                            indent: 16,
                            endIndent: 16,

                          ),
                          MenuItem(
                            icon: Icons.home,
                            title: "Home",
                            onTap: (){
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                              onDrawerIconPressed();
                            },
                          ),
                          MenuItem(
                            icon: Icons.person,
                            title: "My Account",
                            onTap: (){
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                              onDrawerIconPressed();

                            },
                          ),
                          MenuItem(
                            icon: Icons.shopping_basket,
                            title: "Shop",
                            onTap: (){
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                              onDrawerIconPressed();

                            },
                          ),
                          MenuItem(
                            icon: Icons.card_giftcard,
                            title: "Wishlist",
                            onTap: (){
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                              onDrawerIconPressed();

                            },
                          ),
                          Divider(
                            height: 64,
                            thickness: 0.5,
                            color:  Colors.white.withOpacity(0.3),
                            indent: 16,
                            endIndent: 16,

                          ),
                          MenuItem(
                            icon: Icons.settings,
                            title: "Logout",
                            onTap: (){
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                              onDrawerIconPressed();

                            },
                          ),
                          MenuItem(
                            icon: Icons.exit_to_app,
                            title: "Exit",
                            onTap: (){
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                              onDrawerIconPressed();

                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.8),
                    child: GestureDetector(
                      onTap: () {
                        onDrawerIconPressed();
                      },

                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        height: 110,
                        width: 45,
                        color: Color(0xFF262AAA),
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Color(0xFF1BB5FD),
                        ),
                      ),
                    ),
                    ),
                  ),
                ],

            ),
          ),
        );
      }
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
  Paint paint = Paint();
  Path path = Path();

  paint.color = Colors.white;
  final width = size.width;
  final height = size.height;

  path.moveTo(0, 0); //Starting point to clip
  path.quadraticBezierTo(0, 8, 10, 16);
  path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
  path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
  path.quadraticBezierTo(0, height -  8, 0, height);

  path.close();

  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
