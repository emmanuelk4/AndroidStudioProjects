import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbanbliss/DifferentClippers/CustomShapeClipper.dart';
import 'package:urbanbliss/Pages/HomePage.dart';

final Color discountbackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class ClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Search Result"),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:<Widget> [
            ClassListTopPart(),
            ClassListBottom(),
          ],
        ),
      ),
    );
  }
}

class ClassListTopPart extends StatelessWidget {
  Color firstColor = Color(0xFFFF0000);
  Color secondCOlor = Color(0xFFEF722C);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget> [
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:Alignment.topCenter ,
                end: Alignment.bottomCenter,
                colors: [
                  firstColor,
                  secondCOlor,
                ],
              ),
            ),
            height: 160,
          ),
        ),
        Column(
          children:<Widget> [
            SizedBox(height: 20,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.all(Radius.circular(16.0),
                  ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children:<Widget>[
                   Expanded(
                     flex: 5,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:<Widget> [
                         Text(
                           "Math",
                           style: TextStyle(
                               fontSize: 16.0
                           ),
                         ),
                         Divider(
                           color: Colors.grey,
                           height: 20.0,
                         ),
                         Text("19th Century History",
                           style: TextStyle(fontSize: 16.0,
                               fontWeight: FontWeight.bold),
                         ),
                       ],
                     ),
                   ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.import_export,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
class ClassListBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Text(
            "Popular Classes",
            style: dropDownMenuItemStyle,
          ),
          SizedBox(
            height: 10.0,
          ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: FixedExtentScrollPhysics() ,
              children:<Widget>[
                ClassCard(),
                ClassCard(),
                ClassCard(),
                ClassCard(),
                ClassCard(),
                ClassCard(),
                ClassCard(),
                ClassCard(),
                ClassCard(),
              ],
            )

        ],
      ),
    );
  }
}
class ClassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin:const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            border: Border.all(color: flightBorderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Row(
                  children: <Widget>[
                    Text(
                      "20th Century Colonialism",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 4.0,
                    ),
                    Text(
                      "By Murage Kibicho",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  runSpacing: -8.0,
                  spacing: 8.0,
                  children:<Widget>[
                    ClassDetailChip(Icons.calendar_today, "June 2020"),
                    ClassDetailChip(Icons.flight_land, "Kibabes"),
                    ClassDetailChip(Icons.star, "4.4"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                "55%",
                style:TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: discountbackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10),
                ),
              ),
            ),
        ),
      ],
    );
  }
}
class ClassDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;
  ClassDetailChip(this.iconData, this.label);
  @override
  Widget build(BuildContext context) {
    return RawChip(
    label: Text(label),
      backgroundColor: Colors.black,
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        backgroundColor: chipBackgroundColor,
        ),
      avatar: Icon(iconData, size: 14.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0),
        ),
      ),
    );
  }
}


