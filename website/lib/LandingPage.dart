import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:js';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "web/assets/images/ama-dablam2-most-beautiful-mountains-in-the-world.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Color(0xdd044782),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        //Page logo
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Container(
                            height: 80,
                            child: Image.asset(
                              "web/assets/images/ama-dablam2-most-beautiful-mountains-in-the-world.jpg",
                                fit:BoxFit.cover,
                             ),
                          ),
                        ),
                        //title
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: SelectableText(
                            // Replace with your landing page website title.
                            "Kibicho",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        //Landing Page descripti
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          padding: EdgeInsets.only(top:8),
                          child: SelectableText(
                            "Just another nigga",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: SelectableText(
                          "#flutter #flutterdev #flutterdotph",
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget> [
                              Container(
                                height: 48,
                                width: 48,
                                child: FlatButton(
                                  onPressed: () {
                                    _launchUrl(
                                      "https://example.com",
                                    );
                                  },
                                  child: Image.asset(
                                    "web/assets/images/ama-dablam2-most-beautiful-mountains-in-the-world.jpg",
                                      color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                height: 48,
                                width: 48,
                                child: FlatButton(
                                  onPressed: () {
                                    _launchUrl(
                                      "https://example.com",
                                    );
                                  },
                                  child: Image.asset(
                                    "web/assets/images/ama-dablam2-most-beautiful-mountains-in-the-world.jpg",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                height: 48,
                                width: 48,
                                child: FlatButton(
                                  onPressed: () {
                                    _launchUrl(
                                      "https://example.com",
                                    );
                                  },
                                  child: Image.asset(
                                    "web/assets/images/ama-dablam2-most-beautiful-mountains-in-the-world.jpg",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Column(
                            children: <Widget> [
                              Container(
                                child: Text(
                                  "Supported by",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
  void _launchUrl(String url){
    //js.context.callMethod("open", [url]);
  }
}