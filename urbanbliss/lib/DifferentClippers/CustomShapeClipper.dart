import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
  final Path path = Path();
  var firstEndPoint = Offset(size.width / 2, size.height - 30);
  var firstControlPoint = Offset(size.width / 4, size.height - 50 );
  path.lineTo(0.0, size.height);
  path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,firstEndPoint.dx, firstEndPoint.dy);
  var secondEndPoint = Offset(size.width, size.height -80);
  var secondControlPoint = Offset(size.width * 0.75 , size.height-10);
  path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,secondEndPoint.dx, secondEndPoint.dy);

  path.lineTo(size.width, 0.0);

  path.close();
  return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}