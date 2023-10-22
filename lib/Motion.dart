import 'package:flutter/material.dart';
import 'package:inquisitive_scholars_app/build_chapter_home.dart';
import 'package:inquisitive_scholars_app/build_chapter_content.dart';

import 'card_content.dart';


Map imageIds = {
  "pendulum_1":"https://drive.google.com/uc?export=view&id=1rRhYKcRPjPsZSmnPfGjM82mHFbffUChL",
  "swing_gif": "https://drive.google.com/uc?export=view&id=1rtSeLXqZ0mpziLEoyxTKXS3l_nr_MMBz",
  "earth_revolution":"https://drive.google.com/uc?export=view&id=19w37MfCTkDVXLK75J7AnTYXA7ZY3v1h9",
  "pendulum_2":"https://drive.google.com/uc?export=view&id=1TSDFY_bkLLxMPhC5i15bWxjbQw00T71i",
  "spring":"https://drive.google.com/uc?export=view&id=190VrQVnYdwkxPdZM7Op8nigTkuYuQ1Is"

};

class MotionChapterContent extends StatefulWidget {
  const MotionChapterContent({super.key});


  @override
  State<MotionChapterContent> createState() => _MotionChapterContentState();
}

class _MotionChapterContentState extends State<MotionChapterContent> {
  List<CardContent> cardContents = [
    CardContent(type:0, text: "Motion: "),
    CardContent(type:1, text: "Observe the moving objects in each of these images..."),
    CardContent(type:6, options: [imageIds['swing_gif'], imageIds['earth_revolution'],imageIds['pendulum_2'],imageIds['spring']]),
    CardContent(type:5),
    // CardContent(type:3, question: "In the above images what can you say about the position of object with time", options:['1'], answer:0),
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
    return BuildChapterContent(title: "Motion Of Objects", topic: "motion", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}