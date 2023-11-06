import 'package:flutter/material.dart';
import 'package:IS/build_chapter_content.dart';
 
import 'card_content.dart';


Map imageIds = {
  "moving_train":"https://drive.google.com/uc?export=view&id=1Xu0KbYYD3ZQOlGBeKwSAK5SS2Dy0JWvp",
  "inside_train":"https://drive.google.com/uc?export=view&id=1W_xEkkqicUKiC8PHRwvMfxh_7_K8RvQu",
  "reference_point":"https://drive.google.com/uc?export=view&id=1YMJUJHzDFHjwipiCjXMfUMft3Ic6YHwS",
  "reference_point_explained":"https://drive.google.com/uc?export=view&id=1jJkwqF1Pa6wONLz3trJDfGPJbwJSc1C4",
  "car_race":"https://drive.google.com/uc?export=view&id=1oC3zVPISy5b4G_wrzj5JmIy_Ut7xhjkH"
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
    CardContent(type:1, text: "So Train seems to be the one moving or we can say its in MOTION and every other thing seems not moving or we can say is at REST"),
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
        "For person siting inside, the tree seems to be moving but for the person standing outside, the train seems to be moving"),
    CardContent(type:5),
    CardContent(type:1, text: "Hence you need a REFERENCE POINT to decide what are in MOTION and which are at REST"),
    CardContent(type:5),
    CardContent(type: 2, image:imageIds['reference_point']),
    CardContent(type:5),
    CardContent(type: 2,image:imageIds['reference_point_explained']),
    CardContent(type:5),
    CardContent(type:7, text:"An object is said to be in MOTION if its position changes with respect to a REFERENCE POINT",
        options: ["MOTION","CHANGES POSITION","REFERENCE POINT"]),
    CardContent(type:5),
    CardContent(type:0, text: "Speed "),
    CardContent(type:1, text: "Now that you have understood what is a REFERENCE POINT, further down the lesson consider YOU (viewing this phone) is at rest as our Reference point"),
    CardContent(type:5),
    CardContent(type:1, text: "Look at the race in the image below, (with you as reference point) both the cars are in motion right ?"),
    CardContent(type: 1, text:"Can you tell me which car is moving fast ?"),
    CardContent(type: 2, image:imageIds['car_race']),
    CardContent(type:5),
    CardContent(type: 1, text:"Right, it's the blue one. Can you tell me on what parameters did you decide that ?"),
    CardContent(type:5),
    CardContent(type: 3, question:"In general, on what basis can you decide that one is moving faster than the other ?",
    options: ["Distance travelled","Time taken","Both Distance and Time"], answer: 2),
    CardContent(type:5),
    CardContent(type: 1, text:"So its both the DISTANCE travelled and TIME taken that decided who is moving faster, in other words its called speed"),
    CardContent(type:7, text:"The SPEED of an object is the measure of DISTANCE it travels in a UNIT TIME",
        options: ["SPEED","DISTANCE","UNIT TIME"]),
    CardContent(type:5),
    CardContent(type: 0, text:"Speed = Distance / Time "),
    CardContent(type: 1, text:"So what is the unit for speed ? "),
    CardContent(type: 1, text:"SI Unit of speed is \n"
        " ( SI unit of DISTANCE / SI unit of TIME )  \n= ( meter / second ) \n Which is read as meters per second denoted as m/s"),
    CardContent(type:5),
    CardContent(type: 3, question:"In the car race above, what is the speed of BLUE car in kilometer per second (km/s)?",
        options: ["5/6 Km/s", "10/6 Km/s", "1 Km/s", "6/10 Km/s"], answer: 1, text:"Speed = Distance / Time = 10 Km / 6 Sec = 10/6 Km/s"),
    CardContent(type:5),
    CardContent(type: 3, question:"In the car race above, what is the speed of RED car in kilometer per second (km/s)?",
        options: ["5/6 Km/s", "10/6 Km/s", "1 Km/s", "6/10 Km/s"], answer: 0, text:"Speed = Distance / Time = 5 Km / 6 Sec = 5/6 Km/s"),
    CardContent(type:5),
    CardContent(type: 1, text:"Now let's consider a different scenario where you and your friend Hari going to school Monday morning"),
    CardContent(type: 3, question:"Hari's home is 8 km and yours is 12 km from school. Hari catches a school Bus and reaches in 20 minutes, you ride bike to school and take 30 minutes. What is the Speed of School bus in meters/second?",
        options: ["8000/(20*60) m/s", "8000/20 m/s", "8/20 m/s", "8/60 m/s"], answer: 0, text:"Speed = Distance in meter / Time in second \n we know, 1 Km=1000 meters and 1 minute=60 seconds \n= 8*1000 m / 20*60 Seconds"),
    CardContent(type:5),
    CardContent(type: 3, question:"In the above scenario, What is the Speed of You riding a bike in meters/second?",
        options: ["12000/60 m/s", "12000/(30*60) m/s", "12/30 m/s", "12/(30*60) m/s"], answer: 1, text:"Speed = Distance in meter / Time in second \n we know, 1 Km=1000 meters and 1 minute=60 seconds \n= 12*1000 m / 30*60 Seconds"),
    CardContent(type:5),
    CardContent(type: 1, text:"Now if you and Hari decide to start at same time who reaches to school first ?"),
    CardContent(type:5),
    CardContent(type: 1, text:"Both reach at same time, can you see why...its not just distance or time taken it's what distance is covered in unit time: SPEED"),
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
    return BuildChapterContent(title: "Motion And Speed", topic: "Speed", cardContents: cardContents, updateCardFunction: updateCard, cardLength: cardContentLength );
  }
}