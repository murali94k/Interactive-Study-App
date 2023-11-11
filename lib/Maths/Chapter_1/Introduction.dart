
import 'package:flutter/material.dart';
import 'package:IS/BuildChapterContent.dart';

import '../../CardContentSchema.dart';


Map imageIds = {
  "number_line":"https://drive.google.com/uc?export=view&id=14sX2fFJ5aroiLyG7RwQNzOtyTjpTKqpG",
  "sqrt_projection": "https://drive.google.com/uc?export=view&id=1i2sJwAV62LrqWh41pxk91YAeA-33R5pr",
  "rational_number":"https://drive.google.com/uc?export=view&id=1peS6kn6L2cyRzX129PDIgvk8E3PaeDaD",
  "square_2":"https://drive.google.com/uc?export=view&id=1pSQn8WdE1CR8g3X8kqD0ai2Kgd06JYpn"
};
class Introduction extends StatefulWidget {
  const Introduction({super.key});


  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  List<CardContent> cardContents = [
    CardContent(type:0, text: "Natural Numbers"),
    CardContent(type:1, text: "We all have started our first journey with numbers back in kindergarten with One, Two, Three . . . We call these Natural numbers, represented with symbol N"),
    CardContent(type:1, text: "N = {1, 2, 3, 4,. . . }"),
    CardContent(type: 5),
    CardContent(type:0, text: "Whole Numbers"),
    CardContent(type:1, text: "As we advance to higher class we learn arithmetic operations on these numbers. Something interesting happens as we subtract one Natural number by itself, for example:  2 - 2 we know it’s called Zero"),
    CardContent(type:1, text: "But it’s not in N , so let’s add this to N and call this Whole numbers W"),
    CardContent(type:1, text: "W = {0, 1, 2, 3, . . .}"),
    CardContent(type: 5),
    CardContent(type:0, text: "Integers"),
    CardContent(type:1, text: "What happens when we subtract a bigger Natural number from a smaller number, for example 4 - 6."),
    CardContent(type:1, text: "We get negative number which is again not in N or W so let’s include this to our existing W and call this integers Z"),
    CardContent(type:1, text: "Z = {. . . -2, -1, 0, 1, 2, 3 . . . }"),
    CardContent(type: 5),
    CardContent(type:1, text: "Let’s represent integers geometrically on a number line . . ."),
    CardContent(type: 2, image:imageIds['number_line']),
    CardContent(type: 5),
    CardContent(type:1, text: "Observe the number line there are gaps between every integer for example between 1 and 2, 2 and 3 and so on"),
    CardContent(type:1, text: "How can we represent these gaps as numbers ?"),
    CardContent(type: 5),
    CardContent(type:0, text: "Rational Numbers"),
    CardContent(type:1, text: "Let’s find out one number between 1 and 2, how about exactly mid way . . ."),
    CardContent(type: 2, image:imageIds['rational_number']),
    CardContent(type: 5),
    CardContent(type:1, text: "This is not an integer because it's clearly neither 0 nor 1 but in between. But notice that it's made of only integers."),
    CardContent(type:1, text: "This representation is called Rational Numbers represented by Q."),
    CardContent(type:7, text: "Rational number is denoted as p / q where p and q both are integers and q!=0", options: ["RATIONAL NUMBER", "P/Q", "P,Q INTEGERS", "Q!=0"]),
    CardContent(type: 5),
    CardContent(type: 3, question:"How many Rational numbers are there between integers 0 and 1 ?", options:["one","Ten","Infinitely Many"], answer: 2),
    CardContent(type: 5),
    CardContent(type: 3, question:"Do you think we have covered everything on this number line ? Can you represent ANY point on this number line with a rational number ?", options: ["Yes","No"],answer: 1),
    CardContent(type: 5),
    CardContent(type:1, text: "Let’s take number 2 on this number line, can you tell me what rational number whose square is equal to 2 ? \ni,e. Find two integers p and q such that (p/q)^2 = 2"),
    CardContent(type: 5),
    CardContent(type:1, text: "Let’s try some rational numbers shall we . . .?"),
    CardContent(type: 2, image:imageIds['square_2']),
    CardContent(type: 5),
    CardContent(type: 1, text:"We can get very very close to 2 but not exactly 2. Interesting isn’t it !"),
    CardContent(type:1, text: "we cannot find a rational number whose square is 2 !"),
    CardContent(type: 5),
    CardContent(type:1, text: "So there are gaps in the number line that are not Rational, we call these Irrational numbers. In our above example root 2 is an irrational number."),
    CardContent(type: 5),
    CardContent(type:0, text:"Irrational Numbers"),
    CardContent(type:1, text: "Although we can’t know the exact decimal equivalent of root 2 because its not rational we can still geometrically represent it."),
    CardContent(type:1, text: "Can you think of how !"),
    CardContent(type: 5),
    CardContent(type:1, text: "Hint: pythagorean Theorem. What is the diagonal of square with side 1 unit"),
    CardContent(type: 5),
    CardContent(type:1, text: "Let’s place this triangle on a number line and see where exactly root 2 is on the number line."),
    CardContent(type: 2, image:imageIds['sqrt_projection']),
    CardContent(type:1, text: ""),
    CardContent(type: 5),
    CardContent(type: -1),
  ];
  int cardContentLength = 25;

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
    return BuildChapterContent(title: "Numbers", topic: "Numbers", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}