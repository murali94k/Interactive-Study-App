
import 'package:flutter/material.dart';
import 'package:IS/BuildChapterContent.dart';

import '../../CardContentSchema.dart';


Map imageIds = {
  "pendulum_1":"https://drive.google.com/uc?export=view&id=1rRhYKcRPjPsZSmnPfGjM82mHFbffUChL",
  "swing_gif": "https://drive.google.com/uc?export=view&id=1rtSeLXqZ0mpziLEoyxTKXS3l_nr_MMBz",
  "earth_revolution":"https://drive.google.com/uc?export=view&id=19w37MfCTkDVXLK75J7AnTYXA7ZY3v1h9",
  "pendulum_2":"https://drive.google.com/uc?export=view&id=1TSDFY_bkLLxMPhC5i15bWxjbQw00T71i",
  "spring":"https://drive.google.com/uc?export=view&id=190VrQVnYdwkxPdZM7Op8nigTkuYuQ1Is",
  "pendulum_3":"https://drive.google.com/uc?export=view&id=1NW62LMLnxquMJNV-TrY18PDH3YsRNARE",
  "pendulum_snake":"https://drive.google.com/uc?export=view&id=1aJGYBUEFktWGl7eOkd2gAIhMeQyrlPE_",
  "pendulum_clock":"https://drive.google.com/uc?export=view&id=1r940bqHBr6mwofliS4Lc7C9qjCvtskPX"
};

class MotionChapterContent extends StatefulWidget {
  const MotionChapterContent({super.key});


  @override
  State<MotionChapterContent> createState() => _MotionChapterContentState();
}

class _MotionChapterContentState extends State<MotionChapterContent> {
  List<CardContent> cardContents = [
    CardContent(type:0, text: "Motion "),
    CardContent(type:1, text: "Observe the moving objects in each of these images..."),
    CardContent(type:6, options: [imageIds['swing_gif'], imageIds['earth_revolution'],imageIds['pendulum_2'],imageIds['spring']]),
    CardContent(type:5),
    CardContent(type:3, question: "What is common about the objects (person on swing, earth revolving, ball tied to spring) in the above images ",
        options:['Objects are in motion','Object return to same position after some fixed time', 'Objects repeating its motion after every fixed time','All the above'], answer:3),
    CardContent(type:5),
    CardContent(type:7, text:"A movement that repeats itself at regular intervals of time is called periodic motion.",
    options: ["PERIODIC MOTION", "MOVING", "REPEATS", "REGULAR INTERVAL"]),
    CardContent(type:1, text:"Can you think of other 5 examples for periodic motion"),
    CardContent(type:5),
    CardContent(type: 1, text:"Here are some examples for periodic motion: \n1. Back and forth movement of rocking chair.\n2. Vibration of Guitar String\n3. Rotation of Fan at fixed speed"),
    CardContent(type:5),
    CardContent(type:3, question:"Mark which of the following is NOT an example for periodic motion",
    options: ["Ticking hand of Clock", "Falling stone from a building", "Revolution of Earth", "Rotation of Earth"], answer:1,
    text:"Explanation:\nFalling stone does not REPEATS itself, it stays on the ground"),
    CardContent(type:5),
    CardContent(type: 1, text: "Now let's look at one specific example of periodic motion, that is Simple Pendulum."),
    CardContent(type: 0, text:"Simple Pendulum"),
    CardContent(type: 2, image:imageIds["pendulum_1"]),
    CardContent(type:5),
    CardContent(type: 1, text:"lets look at the parts of simple pendulum:\n1. There is a small ball known as MASS tied to string hung from a fixed top\n"
        "2. There is a string which attaches mass to a fixed support\n3. The Mass MOVES from point  A (start) to B (end) and REPEATS itself at FIXED INTERVAL, hence its a Periodic Motion\n"
        "4. Position E is the position of Mass (pendulum) when its not moving is called Mean Position"),
    CardContent(type:5),
    CardContent(type:7, text:"One complete to-and-fro movement of pendulum is called oscillation.",
       options:['OSCILLATION','ONE TO-AND-FRO MOVEMENT']),
    CardContent(type:5),
    CardContent(type: 3, question:"In the above image when is one OSCILLATION is said to be completed ? ",
        options:["Movement of Mass from MEAN Position to START", "Movement of Mass from MEAN Position to END", "Movement of Mass from START position to END", "Movement of Mass from START position to END back to START"], answer:3),
    CardContent(type:5),
    CardContent(type: 7, text:"Time taken by a pendulum to complete one oscillation is called time period of that pendulum.",
    options:['TIME PERIOD', 'TIME FOR', 'ONE OSCILLATION']),
    CardContent(type:5),
    CardContent(type: 3, question:"If a pendulum makes 10 oscillations in 10 seconds time, what is the time period of this pendulum ?",
    options: ['1 second','2 seconds','10 seconds','5 seconds'],answer: 0, text:"Its time for one oscillation \ni,e (total no. of oscillations / total time taken) = ( 10 seconds / 10 oscillation) = 1 second"),
    CardContent(type:5),
    CardContent(type: 1, text:"Here is a pendulum clock."),
    CardContent(type: 2, image:imageIds["pendulum_clock"] ),
    CardContent(type: 3, question:"What is the TIME PERIOD of this pendulum ?", options:['1 second','2 seconds', '0.5 second', "Can't be determined"], answer:1,
    text:"Explanation:\n Observe the pendulum makes one complete oscillation in 2 seconds hence \n   TIME PERIOD = 2 seconds / 1  = 2 seconds"),
    CardContent(type:5),
    CardContent(type: 1, text:"Now observe three pendulum (red, brown and black) oscillating here ..."),
    CardContent(type: 2, image:imageIds["pendulum_2"] ),
    CardContent(type: 1, text:"Activity:\nCalculate the time period of all three pendulum.\nHint:\n TIME PERIOD = (total no. of oscillations / total time taken) "),
    CardContent(type:5),
    CardContent(type: 1, text:"Activity:\nAnswer with SAME or DIFFERENT for the following:\n1. Lengths of strings of three pendulum\n2. Time Period\n3. Start, mean and end  positions\n4. Mass of pendulum"),
    CardContent(type:5),
    CardContent(type: 1, text:"Notice that :\n1. Lengths of strings of three pendulum : ALL SAME \n2. Time Period: ALL SAME \n3. Start, mean and end positions: ALL DIFFERENT \n4. Mass of pendulum: ALL SAME"),
    CardContent(type:5),
    CardContent(type: 1, text:"Now observe three pendulum (red, brown and black) oscillating here ..."),
    CardContent(type: 2, image:imageIds["pendulum_3"] ),
    CardContent(type: 1, text:"What do you notice about the following:\n1. Lengths of strings of three pendulum\n2. Time Period\n3. Start, mean and end  positions\n4. Mass of pendulum"),
    CardContent(type:5),
    CardContent(type: 1, text:"Notice that :\n1. Lengths of strings of three pendulum : ALL DIFFERENT \n2. Time Period: ALL DIFFERENT \n3. start, mean and end positions: ALL DIFFERENT \n4. Mass of pendulum: ALL SAME"),
    CardContent(type:5),
    CardContent(type: 1, text:"Very Interesting observation right! Go back and see if you can see some relation with TIME PERIOD, LENGTH and MASS of pendulum in general."),
    CardContent(type:5),
    CardContent(type:3, question:"Which of the following is/are true for pendulum ?",
    options:["Time period changes with change in length of pendulum", "Mass has no effect on time period", "time period increases with increase in length", "all the above"], answer:3),
    CardContent(type:5),
    CardContent(type: 1, text:"TIME PERIOD of simple pendulum INCREASES with INCREASES in LENGTH and remains CONSTANT for FIXED LENGTH string"),
    CardContent(type:5),
    CardContent(type: 1, text:"Are you ready for the MAGIC with just the principles we have learnt so far..."),
    CardContent(type:5),
    CardContent(type: 2, image: imageIds["pendulum_snake"]),
    CardContent(type: 1, text:"Can you see what is the reason behind it moving like this?"),
    CardContent(type:5),
    CardContent(type: -1),
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