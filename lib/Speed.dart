import 'package:flutter/material.dart';
import 'package:IS/build_chapter_content.dart';

import 'card_content.dart';


Map imageIds = {
  "moving_train":"https://drive.google.com/uc?export=view&id=1Xu0KbYYD3ZQOlGBeKwSAK5SS2Dy0JWvp",
  "inside_train":"https://drive.google.com/uc?export=view&id=1W_xEkkqicUKiC8PHRwvMfxh_7_K8RvQu",
  "reference_point":"https://drive.google.com/uc?export=view&id=1YMJUJHzDFHjwipiCjXMfUMft3Ic6YHwS",
  "reference_point_explained":"https://drive.google.com/uc?export=view&id=1jJkwqF1Pa6wONLz3trJDfGPJbwJSc1C4"
};

class SpeedChapterContent extends StatefulWidget {
  const SpeedChapterContent({super.key});


  @override
  State<SpeedChapterContent> createState() => _SpeedChapterContentState();
}

class _SpeedChapterContentState extends State<SpeedChapterContent> {
  List<CardContent> cardContents = [
    CardContent(type:0, text: "Motion "),
    CardContent(type:2, image: imageIds['moving_train']),
    CardContent(type:1, text: "In the image above identify the objects that seems to be moving and those that seems to be not moving from your perspective"),
    CardContent(type:5),
    CardContent(type:1, text: "So Train seems to be the one moving or we can say its in MOTION right and every other thing seems not moving or we can say is at REST"),
    CardContent(type:5),
    CardContent(type:1, text: " Now let's catch that train in next station. So you are now inside this train"),
    CardContent(type:2, image: imageIds['inside_train']),
    CardContent(type:1, text: "Now identify the objects that seems to be moving..."),
    CardContent(type:5),
    CardContent(type:1, text: "How interesting, every other thing except train seems to be in MOTION now ! HOW ?"),
    CardContent(type:5),
    CardContent(type:1, text: "Now look at both the images and tell me is the train which is moving or the trees outside ?"),
    CardContent(type:5),
    CardContent(type:1, text: "To answer this you need to ask one question with respect to what (also called a REFERENCE POINT). \n"
        "For person siting inside, the tree seems to be moving but for the person standing outside the train seems to be moving"),
    CardContent(type:5),
    CardContent(type:1, text: "Hence you need a REFERENCE POINT to decide what are in MOTION and which are at REST"),
    CardContent(type:5),
    CardContent(type: 2, image:imageIds['reference_point']),
    CardContent(type:5),
    CardContent(type: 2,image:imageIds['reference_point_explained']),
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
    return BuildChapterContent(title: "Motion And Speed", topic: "Speed", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}