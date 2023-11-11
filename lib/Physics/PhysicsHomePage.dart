import 'package:flutter/material.dart';

import 'Chapter_1/ChapterHome.dart';

double rowPadding = 30;
var pageColor = Colors.pinkAccent[100];

TextStyle chapterName = const TextStyle(
  color: Colors.black,
  fontFamily: "Lato",
  fontSize: 18,
);

List chapterTiles = [
  {"id":"1", "title":"Time Motion And Speed", "subtitle": "Chapter-1", "navigation":ChapterHomeOne()},
];

class PhysicsHome extends StatelessWidget {
  const PhysicsHome({super.key});

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
          Text("Chapters", style: TextStyle(
            fontSize: 23,
            fontFamily: "Lato",
            color: pageColor,
            fontWeight: FontWeight.bold
          )),
          Text("Class X   |   NCRT", style: TextStyle(
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
