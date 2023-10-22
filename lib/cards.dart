import 'package:flutter/material.dart';
import 'card_content.dart';

double pageFont = 17.0;
double headingFont = 21.0;
double cardPadding = 10.0;

String textCardFontFamily = "EXo2";
String quizCardFontFamily = "TiltNeon";

var submitBGColor = Colors.amber[50];
var submitFGColor = Colors.black;
var textCardColor = Colors.white;
var quizCardColor = Colors.grey[200];
var frozenQuizCardColor = Colors.grey[300];
var quizCorrectOption = Colors.lightGreen[300];
var quizSelectedOption = Colors.grey[400];
var quizCardShadowColor = Colors.cyan[900];

var quizCardElevation = 0.0;

class HorizontalScrollCard extends StatefulWidget {
  HorizontalScrollCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<HorizontalScrollCard> createState() => _HorizontalScrollCardState();
}

class _HorizontalScrollCardState extends State<HorizontalScrollCard> {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270, // card height
      child: PageView.builder(
        itemCount: widget.cardContent.options.length,
        controller: PageController(viewportFraction: 0.7),
        onPageChanged: (int index) => setState(() => _index = index),
        itemBuilder: (_, i) {
          return Transform.scale(
            scale: i == _index ? 1 : 0.9,
            child: Card(
              elevation: quizCardElevation,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: quizCardElevation,
                  margin: EdgeInsets.all(cardPadding),
                  child:Image.network(widget.cardContent.options[i],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



class QuizCard extends StatefulWidget {
  QuizCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<QuizCard> createState() => _QuizCardState();
}
class PauseCard extends StatefulWidget {
  PauseCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<PauseCard> createState() => _PauseCardState();
}
class InactiveQuizCard extends StatefulWidget {
  InactiveQuizCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<InactiveQuizCard> createState() => _InactiveQuizCardState();
}
class TextCard extends StatefulWidget {
  TextCard({super.key, required this.cardContent});

  CardContent cardContent;

  @override
  State<TextCard> createState() => _TextCardState();
}
class ImageCard extends StatefulWidget {
  ImageCard({super.key, required this.cardContent});

  CardContent cardContent;

  @override
  State<ImageCard> createState() => _ImageCardState();
}
class MakeCard extends StatefulWidget {
  MakeCard({super.key, required this.cardContent, required this.index, required this.updateCardFunction});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<MakeCard> createState() => _MakeCardState();
}

class _QuizCardState extends State<QuizCard> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: quizCardColor,
        child: Column(
          children: [
            Container(
                color: quizCardColor,
                padding: EdgeInsets.all(cardPadding),
                child: Text(widget.cardContent.question,
                style: TextStyle(
                  fontFamily: quizCardFontFamily,
                  fontSize: pageFont
                 )
                )
            ),
            Column(
              children: widget.cardContent.options.map((option)=>
                  ListTile(
                    title: Text(option,
                    style: TextStyle(
                      fontSize: pageFont,
                      fontFamily: quizCardFontFamily
                      ),
                    ),
                    leading: Radio<int>(
                      value: widget.cardContent.options.indexOf(option),
                      groupValue: selectedOption,
                      activeColor: Colors.cyan[900], // Change the active radio button color here
                      splashRadius: 40, // Change the splash radius when clicked
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  )).toList(),
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: submitBGColor,
                    foregroundColor: submitFGColor,
                    padding: const EdgeInsets.all(10.0),
                    textStyle: TextStyle(fontSize: pageFont),
                  ),
                  onPressed: () {
                    CardContent newCard = CardContent(type: 4, question: widget.cardContent.question,
                        options:widget.cardContent.options,
                        answer:widget.cardContent.answer, selection: selectedOption);// inactiveCard details
                    widget.updateCardFunction(type: 4, index: widget.index, updateType: "replace", newCard: newCard);
                    if(selectedOption==widget.cardContent.answer) {
                      widget.updateCardFunction(
                          type: 5, index: widget.index+1, updateType: "insert");
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            )
          ],
        )
    );
  }
}

class _PauseCardState extends State<PauseCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child:Center(
          child: IconButton(
            iconSize: 30,
            icon: const Icon(Icons.keyboard_double_arrow_down),
            onPressed: () {
              widget.updateCardFunction(index: widget.index, updateType: "remove");
            },
          ),
        ),
    );
  }
}

class _InactiveQuizCardState extends State<InactiveQuizCard> {

  @override
  Widget build(BuildContext context) {
    var resultFontColor = Colors.red[900];
    String resultText = "Incorrect !";
    if(widget.cardContent.answer == widget.cardContent.selection){
      resultFontColor = Colors.green[900];
      resultText = "Correct !";
    }
    return Card(
        elevation: quizCardElevation,
        shadowColor: quizCardShadowColor,
        child: Column(
          children: [
            Container(
                color: frozenQuizCardColor,
                padding: EdgeInsets.all(cardPadding),
                child: Text(widget.cardContent.question,
                    style: TextStyle(
                        fontFamily: quizCardFontFamily,
                        fontSize: pageFont
                    )
                )
            ),
            Column(
              children: widget.cardContent.options.map((option){
                int index_ = widget.cardContent.options.indexOf(option);
                dynamic boxColor = frozenQuizCardColor;
                if(index_ == widget.cardContent.answer){
                  boxColor = quizCorrectOption;
                }
                else if((index_ == widget.cardContent.selection) &&  (widget.cardContent.selection != widget.cardContent.answer)){
                  boxColor = quizSelectedOption;
                }
                return ColoredBox(
                  color: boxColor,
                  child: ListTile(
                    title: Text(option,
                      style: TextStyle(
                          fontSize: pageFont,
                          fontFamily: quizCardFontFamily
                      ),
                    ),
                  ),
                );
               }).toList()
            ),
            Container(
                padding: EdgeInsets.all(cardPadding),
                child: Text(resultText,
                    style: TextStyle(
                        fontFamily: quizCardFontFamily,
                        fontSize: headingFont,
                        fontWeight: FontWeight.bold,
                        color: resultFontColor
                    )
                )
            ),
          ],
        ),
    );
  }
}

class _TextCardState extends State<TextCard> {
  @override
  Widget build(BuildContext context) {
    if(widget.cardContent.type==0){ // Heading Text Card
      return Card(
          elevation: quizCardElevation,
          shadowColor: Colors.black,
          color: textCardColor,
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(widget.cardContent.text,
                style: TextStyle(
                    fontSize: headingFont,
                    fontWeight: FontWeight.bold
                )
            ),
          )
      );
    }
    return Card(
        elevation: quizCardElevation,
        shadowColor: Colors.black,
        color: textCardColor,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(widget.cardContent.text,
              style: TextStyle(
                  fontSize: pageFont,
                  fontFamily: textCardFontFamily
              )
          ),
        )
    );
  }
}


class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: quizCardElevation,
      margin: EdgeInsets.all(cardPadding),
      child:Image.network(widget.cardContent.image,
        fit: BoxFit.fill,
      ),
    );
  }
}

class _MakeCardState extends State<MakeCard> {
  @override
  Widget build(BuildContext context) {
    if(widget.cardContent.type==1 || widget.cardContent.type==0){
      return TextCard(cardContent: widget.cardContent);
    }
    else if(widget.cardContent.type==2){
      return ImageCard(cardContent: widget.cardContent);
    }
    else if(widget.cardContent.type==3){
      return QuizCard(cardContent: widget.cardContent, index: widget.index, updateCardFunction: widget.updateCardFunction );
    }
    else if(widget.cardContent.type==4){
      return InactiveQuizCard(cardContent: widget.cardContent, index: widget.index, updateCardFunction: widget.updateCardFunction );
    }
    else if(widget.cardContent.type==6){
      return HorizontalScrollCard(cardContent: widget.cardContent, updateCardFunction: widget.updateCardFunction, index: widget.index);}
    else{
      return PauseCard(cardContent: widget.cardContent, index: widget.index, updateCardFunction: widget.updateCardFunction );
    }
  }
}

