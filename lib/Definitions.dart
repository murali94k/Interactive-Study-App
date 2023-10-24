import 'package:flutter/material.dart';
import 'package:IS/build_chapter_content.dart';

import 'card_content.dart';


Map imageIds = {
  "pendulum_1":"https://drive.google.com/uc?export=view&id=1rRhYKcRPjPsZSmnPfGjM82mHFbffUChL",
};

class DefinitionsChapterContent extends StatefulWidget {
  const DefinitionsChapterContent({super.key});


  @override
  State<DefinitionsChapterContent> createState() => _DefinitionsChapterContentState();
}

class _DefinitionsChapterContentState extends State<DefinitionsChapterContent> {
  List<CardContent> cardContents = [
    CardContent(type:0, text: "Definitions "),
    CardContent(type: 2, image:imageIds['pendulum_1']),
    CardContent(type:7, text:"A movement that repeats itself at regular intervals of time is called periodic motion.",
        options: ["PERIODIC MOTION", "MOVING", "REPEATS", "REGULAR INTERVAL"]),
    CardContent(type:5),
    CardContent(type:7, text:"One complete to-and-fro movement of pendulum is called oscillation.",
        options:['OSCILLATION','ONE TO-AND-FRO MOVEMENT']),
    CardContent(type:5),
    CardContent(type: 7, text:"Time taken by a pendulum to complete one oscillation is called time period of that pendulum.",
        options:['TIME PERIOD', 'TIME FOR', 'ONE OSCILLATION']),
    CardContent(type:5),
    CardContent(type:7, text:"An object is said to be in MOTION if its position changes with respect to a REFERENCE POINT",
        options: ["MOTION","CHANGES POSITION","REFERENCE POINT"]),
  ];
  int cardContentLength = 4;

  int updateNextPauseCardIndex() {
    int idx =  cardContents.length;
    for (var i = 0; i < cardContents.length; i++) {
      if (cardContents[i].type == 5) {
        idx = i + 1;
        break;
      }
    }
    setState(() {
      cardContentLength = idx;
    });
    return idx;
  }

  void updateCard({type, index, updateType, newCard}){
    setState(() {
      if (updateType=="replace") {
        if(cardContents[index].text != "") {
          cardContents[index].type = 1;
        }
        else{
          cardContents.removeAt(index);
        }
        cardContents.insert(index, newCard);
      }
      if (updateType=="remove"){
        cardContents.removeAt(index);
      }
    });
    updateNextPauseCardIndex();
  }

  @override
  Widget build(BuildContext context) {
    return BuildChapterContent(title: "Time And Motion", topic: "Definitions", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}