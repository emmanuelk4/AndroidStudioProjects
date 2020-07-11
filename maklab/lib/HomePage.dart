import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:maklab/recents.dart';
import 'package:maklab/NewImage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {


  List<Recents>_recents = [
    Recents("https://image.shutterstock.com/z/stock-photo-real-fluorescence-microscopic-view-of-human-skin-cells-in-culture-nucleus-are-in-blue-actin-1146362690.jpg", "Kibicho"),
    Recents("https://image.shutterstock.com/z/stock-photo-real-fluorescence-microscopic-view-of-human-skin-cells-in-culture-nucleus-are-in-blue-actin-465563519.jpg", "Mak"),
    Recents("https://image.shutterstock.com/z/stock-photo-nicotiana-benthamiana-leaf-protoplasts-expressing-gfp-the-cell-wall-was-removed-by-treatment-with-116328235.jpg", "Hugh"),
    Recents("https://image.shutterstock.com/z/stock-photo-electron-microscopy-photography-of-a-group-of-human-neutrophils-150009971.jpg", "Xingjian"),
    Recents("https://image.shutterstock.com/z/stock-photo-doctor-hand-taking-a-blood-sample-tube-from-a-rack-with-machines-of-analysis-in-the-lab-background-1114244621.jpg", "Aidan"),
    Recents("https://image.shutterstock.com/z/stock-vector-portraits-of-women-of-different-nationalities-and-cultures-struggle-for-freedom-independence-1746248672.jpg", "Xiao"),
    Recents("https://image.shutterstock.com/z/stock-vector-magic-potion-glass-bottle-engraving-vector-illustration-magic-potion-occult-attribute-for-1744049198.jpg", "Zoe")
  ];

  List<NewImage> newImages = [
    NewImage(
        username: "Ruquaiyah",
        userImage: "https://images.pexels.com/photos/4521276/pexels-photo-4521276.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
        postImage: "https://image.shutterstock.com/z/stock-vector-magic-potion-glass-bottle-engraving-vector-illustration-magic-potion-occult-attribute-for-1744049198.jpg",
        caption: "Murage did this"
    ),
    NewImage(
        username: "Lucy",
        userImage: "https://images.pexels.com/photos/4521276/pexels-photo-4521276.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
        postImage: "https://image.shutterstock.com/z/stock-vector-magic-potion-glass-bottle-engraving-vector-illustration-magic-potion-occult-attribute-for-1744049198.jpg",
        caption: "Murage did this"
    ),
    NewImage(
        username: "Beichen",
        userImage: "https://images.pexels.com/photos/4521276/pexels-photo-4521276.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
        postImage: "https://image.shutterstock.com/z/stock-vector-magic-potion-glass-bottle-engraving-vector-illustration-magic-potion-occult-attribute-for-1744049198.jpg",
        caption: "Murage did this"
    ),
    NewImage(
        username: "Murage",
        userImage: "https://images.pexels.com/photos/4521276/pexels-photo-4521276.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
        postImage: "https://image.shutterstock.com/z/stock-vector-magic-potion-glass-bottle-engraving-vector-illustration-magic-potion-occult-attribute-for-1744049198.jpg",
        caption: "Murage did this"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE) ,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEEEE),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "Mak's Lab",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        leading: IconButton(
          onPressed: (){} ,
          icon: Icon(Feather.camera, color: Colors.black,),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon:Icon(Feather.tv, color: Colors.black),
          ),
          IconButton(
            onPressed: (){},
            icon:Icon(FontAwesome.send_o, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20
                  ,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(
                      "Recents",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  vertical:10,
                ),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _recents.map((image){
                    return Column(
                      children:<Widget> [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                  width: 3,
                                  color: Color(0xFF8e44ad)
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.all(2,),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image(
                                image: NetworkImage(image.url),
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(image.name)
                      ],
                    );
                  }).toList(),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: newImages.length,
                  itemBuilder: (ctx, i){
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget> [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget> [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image(
                                          image: NetworkImage(
                                              newImages[i].userImage
                                          ),
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      newImages[i].username,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(SimpleLineIcons.options),
                                  onPressed: (){},
                                ),
                              ],
                            ),
                          ),
                          Image(
                            image: NetworkImage(
                                newImages[i]. postImage
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget> [
                                  IconButton(
                                    icon: Icon(FontAwesome.heart_o),
                                    onPressed: (){},
                                  ),
                                  IconButton(
                                    icon: Icon(FontAwesome.comment_o),
                                    onPressed: (){},
                                  ),
                                  IconButton(
                                    icon: Icon(FontAwesome.send_o) ,
                                    onPressed: (){},
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(FontAwesome.bookmark_o) ,
                                onPressed: (){},
                              ),
                            ],
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 14,),
                            child: RichText(
                              softWrap: true,
                              overflow: TextOverflow.visible,

                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Liked by",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Murage, ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Kibicho and ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "5,000 others",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )

            ],
          ),

        ),
      ),

    );
  }
}

