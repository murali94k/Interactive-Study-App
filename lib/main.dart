import 'package:flutter/material.dart';
import 'package:inquisitive_scholars_app/build_chapter_home.dart';
import 'package:inquisitive_scholars_app/build_chapter_content.dart';

import 'card_content.dart';


Map imageIds = {
  "chapter_home_background":"https://drive.google.com/uc?export=view&id=17tK3dhOAaIGtTQna-wFrl7w1oVytFX71",
  "sun_movement_gif":"https://drive.google.com/uc?export=view&id=13ZWDsSy9K_eGGIdrrhx9OnBoY3MNlcar"
};

class ChapterHome extends StatelessWidget {
  const ChapterHome({super.key});


  @override
  Widget build(BuildContext context) {
    return const BuildChapterHome(title: "Physics", bgImage: "https://drive.google.com/uc?export=view&id=17tK3dhOAaIGtTQna-wFrl7w1oVytFX71", chapterTitle: "Time And Motion");
  }
}

class ChapterContent extends StatefulWidget {
  const ChapterContent({super.key});


  @override
  State<ChapterContent> createState() => _ChapterContentState();
}

class _ChapterContentState extends State<ChapterContent> {
  List<CardContent> cardContents = [
    CardContent(type:1, text: "What comes to your mind when I say word TIME ? Is It a CLOCK "
        "hanging on the wall or your school bell ringing ! Have you ever wondered how to measure time if you don't have clock invented ?"),
    CardContent(type:5),
    CardContent(type:3, question: "Can you tell what part of the day it is by looking at the the moment of sun in the sky ?", options: ['Yes', 'No'], answer: 0),
    CardContent(type:5),
    CardContent(type:1, text: "Observe this image of sun moving across the sky during day. What all do you notice?"),
    CardContent(type:2, image: imageIds['sun_movement_gif']),
    CardContent(type:5),
    CardContent(type:1, text: "Have you noticed how the shadow of the stick is moving with respect to the position of sun in the sky? Interesting isn't it !"),
    CardContent(type:3, text: "Explanation: \nObserve the shadow when sun is in east E and West W in the image above ", question: "Can you now tell me when is the shadow of the stick are longer in day", options: ['During Morning', 'During Evening', 'At Afternoon', 'Both Morning and Evening'], answer: 3),
  ];
  int cardContentLength = 2;

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
    return BuildChapterContent(title: "Time And Motion", topic: "Measuring TIME", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}


void main() {
  runApp(const MaterialApp(
    home: ChapterHome(),
   )
  );
}