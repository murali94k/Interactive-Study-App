import 'package:flutter/material.dart';
import 'package:inquisitive_scholars_app/build_chapter_content.dart';
import 'card_content.dart';


Map imageIds = {
  "pendulum_1":"https://drive.google.com/uc?export=view&id=1rRhYKcRPjPsZSmnPfGjM82mHFbffUChL",
};

class QuizChapterContent extends StatefulWidget {
  const QuizChapterContent({super.key});


  @override
  State<QuizChapterContent> createState() => _QuizChapterContentState();
}


class _QuizChapterContentState extends State<QuizChapterContent> {
  int score = 0;
  int questions = 5;

  List<CardContent> cardContents = [
    CardContent(type:3, text: "", question: "Can you now tell me when is the shadow of the stick are longer in day", options: ['During Morning', 'During Evening', 'At Afternoon', 'Both Morning and Evening'], answer: 3),
    CardContent(type:3, question:"Mark which of the following is NOT an example for periodic motion",
        options: ["Ticking hand of Clock", "Falling stone from a building", "Revolution of Earth", "Rotation of Earth"], answer:1,
        text:"Explanation:\nFalling stone does not REPEATS itself, it stays on the ground"),
    CardContent(type: 2, image:imageIds["pendulum_1"]),
    CardContent(type: 3, question:"In the above image when is one OSCILLATION is said to be completed ? ",
        options:["Movement of Mass from MEAN Position to START", "Movement of Mass from MEAN Position to END", "Movement of Mass from START position to END", "Movement of Mass from START position to END back to START"], answer:3),
    CardContent(type: 3, question:"If a pendulum makes 10 oscillations in 10 seconds time, what is the time period of this pendulum ?",
        options: ['1 second','2 seconds','10 seconds','5 seconds'],answer: 0, text:"Its time for one oscillation \ni,e (total no. of oscillations / total time taken) = ( 10 seconds / 10 oscillation) = 1 second"),
    CardContent(type:3, question:"Which of the following is/are true for pendulum ?",
        options:["Time period changes with change in length of pendulum", "Mass has no effect on time period", "time period increases with increase in length", "all the above"], answer:3),
    CardContent(type: 5),
    CardContent(type:0, text:"Finished")
  ];
  int cardContentLength = 7;


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
      if (updateType=="replace") { // replace quiz with inactive card
        if(cardContents[index].text != "") {
          cardContents[index].type = 1;
        }
        else{
          cardContents.removeAt(index);
        }
        cardContents.insert(index, newCard);
      }
      else if (updateType=="remove"){ // pause card removal
        cardContents.removeAt(index);
        cardContents[cardContents.length-1] = CardContent(type: 0, text: "Final Score : $score / $questions"); // place score card at the end
      }
      else if (updateType=="score"){
        score += 1;
      }
    });
    updateNextPauseCardIndex();
  }

  @override
  Widget build(BuildContext context) {
    return BuildChapterContent(title: "Quiz: Time And Motion", topic: "Quiz", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}