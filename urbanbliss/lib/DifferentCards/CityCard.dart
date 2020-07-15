import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, price;
  CityCard(this.imagePath, this.cityName, this.monthYear, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children:<Widget> [
                Container(
                  height: 200,
                width: 250,
                child: Image.asset(imagePath,
                  fit: BoxFit.cover,
                ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                    width: 250,
                    height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                          Colors.black, Colors.black.withOpacity(0.1)// Can make images darker at bottom to blend with gradient
                      ])
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                    bottom: 10,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget> [
                          Text(cityName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0),),
                          Text(monthYear, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0),),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                          child: Text("Spots left:\n$price",
                            style: TextStyle(fontSize: 14,
                                color: Colors.black),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
