import 'package:flutter/material.dart';
import 'package:inquisitive_scholars_app/build_chapter_home.dart';
import 'package:inquisitive_scholars_app/build_chapter_content.dart';

import 'card_content.dart';


Map imageIds = {
  "chapter_home_background":"https://drive.google.com/uc?export=view&id=17tK3dhOAaIGtTQna-wFrl7w1oVytFX71",
  "sun_movement_gif":"https://drive.google.com/uc?export=view&id=13ZWDsSy9K_eGGIdrrhx9OnBoY3MNlcar",
  "sundial_gif":"https://drive.google.com/uc?export=view&id=1QnEk6eoh46kH1j9ltNiIaxpGv9WF2NgX",
};

class TimeChapterContent extends StatefulWidget {
  const TimeChapterContent({super.key});


  @override
  State<TimeChapterContent> createState() => _TimeChapterContentState();
}

class _TimeChapterContentState extends State<TimeChapterContent> {
  List<CardContent> cardContents = [
    CardContent(type:0, text: "Measuring Time "),
    CardContent(type:1, text: "What comes to your mind when I say word TIME ..."),
    CardContent(type:5),
    CardContent(type:1, text: "Is it a CLOCK hanging on the wall or your school bell ringing ! Have you ever wondered how to measure time if we don't have the CLOCK ?"),
    CardContent(type:5),
    CardContent(type:1, text: "How about Sun as our CLOCK ! "),
    CardContent(type:5),
    CardContent(type:3, question: "Can you approximate whether its Morning, Afternoon or Evening, just by looking at the position of sun in the sky ?", options: ["Yes","No"], answer: 0),
    CardContent(type:5),
    CardContent(type:1, text: "Observe this image of Sun moving across the sky during a day. There is also a stick placed in the middle of the ground. What all things do you notice here ?"),
    CardContent(type:2, image: imageIds['sun_movement_gif']),
    CardContent(type:5),
    CardContent(type:1, text: "Observe the movement of the shadow of the stick placed on the ground"),
    CardContent(type:1, text: "Notice how the shadow of the stick is moving with respect to the position of sun in the sky? Interesting isn't it !"),
    CardContent(type:5),
    CardContent(type:3, text: "", question: "Can you now tell me when is the shadow of the stick are longer in day", options: ['During Morning', 'During Evening', 'At Afternoon', 'Both Morning and Evening'], answer: 3),
    CardContent(type:5),
    CardContent(type:1, text:"Look ! this shadow looks like some CLOCK hand to me. Can you see that too ?"),
    CardContent(type:2, image: imageIds['sundial_gif']),
    CardContent(type:1, text:"This is what is known as SunDial"),
    CardContent(type:5),
    CardContent(type:1, text:"Activity: \n  Think of other ways or tools to approximately measure time."),
  ];
  int cardContentLength = 3;

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
    return BuildChapterContent(title: "Measuring Time", topic: "Measuring TIME", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}