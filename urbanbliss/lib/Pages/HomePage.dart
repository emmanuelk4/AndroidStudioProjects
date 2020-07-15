//News, spotify, youtube
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbanbliss/DifferentCards/CityCard.dart';
import 'package:urbanbliss/DifferentClippers/CustomShapeClipper.dart';
import 'package:urbanbliss/Pages/ClassList.dart';
import 'package:urbanbliss/blocNav/blocNavigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbanbliss/r.dart';

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override //Wrap in Centre
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomePageTopBar(),
            HomePageBottom(),
          ],
        ),
      ),
    );
  }
}

const TextStyle dropDownLabelStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);
const TextStyle dropDownMenuItemStyle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
);

class HomePageTopBar extends StatefulWidget {
  @override
  _HomePageTopBarState createState() => _HomePageTopBarState();
}

class _HomePageTopBarState extends State<HomePageTopBar> {
  Color firstColor = Color(0xFFFF0000);
  Color secondCOlor = Color(0xFFEF722C);
  List<String> classes = ["History", "Math", "Swahili", "Arabic"];
  var selectedClassIndex = 0;
  var isChipSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  firstColor,
                  secondCOlor,
                ],
              ),
            ),
            height: 400.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedClassIndex = index;
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(classes[0]),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(classes[1]),
                            value: 1,
                          ),
                        ],
                        child: Row(
                          children: <Widget>[
                            Text(
                              classes[selectedClassIndex],
                              style: dropDownLabelStyle,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "What do you\n want to learn?",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(text: classes[0]),
                      style: dropDownMenuItemStyle,
                      cursorColor: firstColor,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        border: InputBorder.none,
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder:(context)=>ClassList() ));
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:<Widget>[
                    InkWell(
                     child: ChoiceChip(Icons.flight_land, "Flights", isChipSelected),
                      onTap: (){
                       setState(() {
                         isChipSelected = true;
                       });
                      },
                    ),
                    SizedBox(width: 30,),
                    InkWell(
                      child: ChoiceChip(Icons.hotel, "Hotels", !isChipSelected),
                      onTap: (){
                        setState(() {
                          isChipSelected = false;
                        });
                      },
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isChipSelected;
  ChoiceChip(this.icon, this.text, this.isChipSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isChipSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.all(
            Radius.circular(20.0),
        ),
      ) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageBottom extends StatefulWidget {
  @override
  _HomePageBottomState createState() => _HomePageBottomState();
}
var viewAllStyle = TextStyle(
  color: Color(0xFFFF0000),
  fontSize: 18.0,
);

class _HomePageBottomState extends State<HomePageBottom> {
  List <CityCard> cityCards = [
    CityCard(R.assetsImg3, "History", "Jul 22 - Jul 24", "Full"),
    CityCard(R.assetsImg5, "Math", "Jul 25- Jul 30", "3"),
    CityCard(R.assetsImg4, "Chemistry", "Jul 17 - Jul 24", "9"),

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16) ,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Text(
                "Last Viewed",
                style: (dropDownMenuItemStyle),
              ),
              Spacer(),
              Text(
                "View All(12)",
                style: viewAllStyle
              ),
            ],
          ),
        ),
        Container(
          height: 210,
          child: ListView(

            scrollDirection: Axis.horizontal,
            children: cityCards,
          ),
        ),
      ],
    );
  }
}
