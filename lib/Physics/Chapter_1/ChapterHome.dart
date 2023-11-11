import 'package:flutter/material.dart';

import 'Motion.dart';
import 'Time.dart';
import 'Definitions.dart';
import 'Quiz.dart';
import 'Speed.dart';
import '../../PlayGround/PendulumSwing.dart';
import '../../PlayGround/Matigon.dart';

double rowPadding = 30;
var pageColor = Colors.red[200];

TextStyle chapterName = const TextStyle(
  color: Colors.black,
  fontFamily: "Lato",
  fontSize: 18,
);

List chapterTiles = [
  {"id":"1", "title":"Measure Time", "subtitle": "Chapter-1", "navigation":TimeChapterContent()},
  {"id":"2", "title":"Motion of Objects", "subtitle": "Chapter-2", "navigation":MotionChapterContent()},
  {"id":"3", "title":"Motion And Speed", "subtitle": "Chapter-3", "navigation":SpeedChapterContent()},
  {"id":"4", "title":"Definition Cards", "subtitle": "Revision", "navigation":DefinitionsChapterContent()},
  {"id":"5", "title":"Take Quiz", "subtitle": "Quiz", "navigation":QuizChapterContent()},
  {"id":"6", "title":"Play Ground", "subtitle": "Pendulum Play-Ground", "navigation":PlayGroundChapter()},
  {"id":"7", "title":"Mathigon", "subtitle": "Integrated Play-Ground", "navigation":MathigonChapter()},
];

class ChapterHomeOne extends StatelessWidget {
  const ChapterHomeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: pageColor,
            centerTitle: true,
            title: const Text("Physics", style: TextStyle(
              color: Colors.black,
              fontFamily: "Lato",
              fontSize: 20,))),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PhysicsBanner(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: rowPadding),
                child: Divider(thickness: 2, color: Colors.grey[600],)),
            const Flexible(
              child: ChapterList(),
            )
          ],
        )
    );
  }
}

class PhysicsBanner extends StatelessWidget {
  const PhysicsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(rowPadding, rowPadding, rowPadding, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Topics", style: TextStyle(
              fontSize: 23,
              fontFamily: "Lato",
              color: pageColor,
              fontWeight: FontWeight.bold
          )),
          Text("Chapter-1   |   Time Motion And Speed", style: TextStyle(
              fontSize: 13,
              fontFamily: "Lato",
              color: Colors.grey[600],
              fontWeight: FontWeight.bold
          )),
        ],
      ),
    );
  }
}


class ChapterList extends StatefulWidget {
  const ChapterList({super.key});

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chapterTiles.length,
      itemBuilder: (builder, index) {
        return ListTile(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> chapterTiles[index]['navigation']));},
          title: Text(chapterTiles[index]['title']),
          subtitle: Text(chapterTiles[index]["subtitle"]),
          leading: CircleAvatar(backgroundColor: pageColor,child: Text(chapterTiles[index]["id"], style: chapterName),),
        );
      },
    );
  }
}
