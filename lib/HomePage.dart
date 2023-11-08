import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:IS/PhysicsHomePage.dart';

import 'Motion.dart';
import 'Speed.dart';
import 'PendulumSwing.dart';
import 'Matigon.dart';

double rowPadding = 10;
double contentPaddding = 20;

List topicCards = [{"topic":"Speed", "navigation":SpeedChapterContent() ,"icon":Icons.rocket_launch, "color":Colors.pinkAccent[100], "chapter":"Chapter-2", "subject":"PHYSICS"},
  {"topic":"Motion", "navigation":MotionChapterContent(), "icon":Icons.directions_run, "color":Colors.blue[300], "chapter":"Chapter-8", "subject":"PHYSICS"},
  {"topic":"LCM & HCF", "navigation":SpeedChapterContent(), "icon":Icons.calculate, "color":Colors.orange[200], "chapter":"Chapter-3", "subject":"MATHS"}
];

List courseCards = [{"navigation":PhysicsHome(), "icon":Icons.tips_and_updates_outlined, "color":Colors.pinkAccent[100], "subject":"Physics"},
  {"navigation":PhysicsHome(), "icon":Icons.category_rounded, "color":Colors.lime[400], "subject":"Mathematics"},
  {"navigation":PhysicsHome(), "icon":Icons.science_rounded, "color":Colors.blue[400], "subject":"Chemistry"},
  {"navigation":PhysicsHome(), "icon":Icons.biotech_rounded, "color":Colors.green[300], "subject":"Biology"}
];

List playgroundCards = [{"navigation":PlayGroundChapter(), "icon":Icons.play_arrow, "color":Colors.red[200], "chapter":"Chapter-2", "topic":"Pendulum", "subject":"Pendulum"},
  {"navigation":MathigonChapter(), "icon":Icons.airplay_sharp, "color":Colors.green[200], "chapter":"Chapter-1", "topic":"Mathigon", "subject":"Mathigon"}];

TextStyle welcomeTextStyle_1 = const TextStyle(
  color: Colors.white,
  fontFamily: "Lato",
  fontSize: 14,
);

TextStyle welcomeTextStyle_2 = const TextStyle(
  color: Colors.white,
  fontFamily: "Lato",
  fontSize: 28,
);

TextStyle rowTitleStyle = const TextStyle(
  color: Colors.black,
  fontFamily: "Lato",
  fontWeight: FontWeight.bold,
  fontSize: 22,
);

TextStyle cardTitleStyle({color=Colors.black}){
  TextStyle cardTitleStyle_ =  TextStyle(
      color: color,
      fontFamily: "Lato",
      fontWeight: FontWeight.w800,
      fontSize: 20);
  return cardTitleStyle_;
}

TextStyle chapterFooterStyle = TextStyle(
  color: Colors.teal[900],
  fontFamily: "Lato",
  fontWeight: FontWeight.bold,
  fontSize: 10,
);

TextStyle subjectFooterStyle = TextStyle(
  color: Colors.teal[900],
  fontFamily: "Lato",
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

TextStyle courseTextStyle = TextStyle(
  color: Colors.grey[250],
  fontFamily: "Lato",
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Main column
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Welcome text Row
                  WelcomeTextRow(),
                  // Recommended Topics Row
                  Padding(
                    padding: EdgeInsets.all(2*rowPadding),
                    child: Row(
                      children: [
                        Text("Recommended Topics", style: rowTitleStyle,)
                      ],
                    ),
                  ),
                  RecommendedTopicsRow(),
                  Padding(
                    padding: EdgeInsets.all(2*rowPadding),
                    child: Row(
                      children: [
                        Text("Play Grounds", style: rowTitleStyle,)
                      ],
                    ),
                  ),
                  PlayGroundRow(),
                  Padding(
                    padding: EdgeInsets.all(2*rowPadding),
                    child: Row(
                      children: [
                        Text("Courses", style: rowTitleStyle,)
                      ],
                    ),
                  ),
                  CoursesRow(),
                  SizedBox(height: 20)

                ],
              )
            ],
          )
        )
      ),
    );
  }
}

class WelcomeTextRow extends StatelessWidget {
  const WelcomeTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(rowPadding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xE1065D44),
                  borderRadius: BorderRadius.circular(20),
                ),
              padding: EdgeInsets.symmetric(vertical: contentPaddding, horizontal: contentPaddding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello, Learner", style: welcomeTextStyle_1),
                  const SizedBox(height: 20,),
                  Text("Welcome,\nLet's Start Learning !", style: welcomeTextStyle_2),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Search Topic...',
                              labelStyle:TextStyle(
                                fontSize: 14,
                                fontFamily: "Lato",
                                color: Colors.grey[350],
                              ),
                              filled: false,
                            ),
                            style: const TextStyle(
                                fontFamily: "Lato",
                                fontSize: 20
                            )
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, size: 24, color: Colors.grey[350],), onPressed: () {  },
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecommendedTopicsRow extends StatefulWidget {
  RecommendedTopicsRow({super.key});

  @override
  State<RecommendedTopicsRow> createState() => _RecommendedTopicsRowState();
}

class _RecommendedTopicsRowState extends State<RecommendedTopicsRow> {

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.5,
              aspectRatio: 0.2,
              enlargeCenterPage: true,
              onPageChanged: (position,reason){  },
              enableInfiniteScroll: true,
            ),
            items: topicCards.map<Widget>((topicCard) {
              return Builder(
                builder: (BuildContext context) {
                  return  GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> topicCard['navigation']));},
                  child:Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(contentPaddding,contentPaddding,contentPaddding,0),
                      child: Column(
                        children: [
                          Text(topicCard['topic'], style: cardTitleStyle(color: topicCard['color'])),
                          Divider(thickness: 2, color: Colors.teal[200]),
                          Icon(topicCard['icon'],
                            size: 80, color: topicCard['color'],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(topicCard['chapter'], style: chapterFooterStyle),
                              Text(topicCard['subject'], style: subjectFooterStyle)
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
                },
              );
            }).toList(),
          )
        ),
      ],
    );
  }
}

class CoursesRow extends StatefulWidget {
  const CoursesRow({super.key});

  @override
  State<CoursesRow> createState() => _CoursesRowState();
}

class _CoursesRowState extends State<CoursesRow> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(rowPadding, rowPadding, rowPadding, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 2* rowPadding,
            height: 350,
            child: GridView.count(crossAxisCount: 2,crossAxisSpacing: 4.0,
        mainAxisSpacing: 2.0, childAspectRatio: 1.5, physics: const NeverScrollableScrollPhysics(),
        children: List.generate(courseCards.length, (index) {
            return GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> courseCards[index]['navigation']));},
              child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                child: Container(
                  decoration: BoxDecoration(
                      color: courseCards[index]['color'],
                      borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(courseCards[index]['subject'], style: courseTextStyle),
                      Divider(thickness: 1, color: Colors.grey[100],),
                      Expanded(
                        child: Icon(courseCards[index]['icon'],
                          size: 70, color: Colors.white,),
                      ),
                    ],
                  ),
                )
              ),
            );
        }
        )
            ),
          )
        ],
      ),
    );
  }
}

class PlayGroundRow extends StatefulWidget {
  const PlayGroundRow({super.key});

  @override
  State<PlayGroundRow> createState() => _PlayGroundRowState();
}

class _PlayGroundRowState extends State<PlayGroundRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.5,
                aspectRatio: 0.2,
                enlargeCenterPage: true,
                onPageChanged: (position,reason){  },
                enableInfiniteScroll: true,
              ),
              items: playgroundCards.map<Widget>((playgroundCard) {
                return Builder(
                  builder: (BuildContext context) {
                    return  GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> playgroundCard['navigation']));},
                        child:Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(contentPaddding,contentPaddding,contentPaddding,0),
                            child: Column(
                              children: [
                                Text(playgroundCard['topic'], style: cardTitleStyle(color: playgroundCard['color'])),
                                Divider(thickness: 2, color: Colors.teal[200]),
                                Icon(playgroundCard['icon'],
                                  size: 80, color: playgroundCard['color'],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(playgroundCard['chapter'], style: chapterFooterStyle),
                                    Text(playgroundCard['subject'], style: subjectFooterStyle)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                );
              }).toList(),
            )
        ),
      ],
    );
  }
}



void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  )
  );
}