import 'package:flutter/material.dart';
import 'card_content.dart';

/*
Card types:
0. TextCard heading TextCard: show heading with bold and bigger font
1. TextCard: display simple plain text
2. ImageCard : display single image
3. QuizCard: sing question with radio options
4. InactiveQuizCard: show correct answer for quiz card with question
5. PauseCard: pause content display with action to press down arrow
6. HorizontalScrollCard: Multiple ImageCards stacked horizontally to be able to scroll
7. DefinitionCards: Multiple cards to explain definition well
 */


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
var definitionFontColor = Colors.cyan[900];
var definitionCardColor = Colors.grey[300];
List definitionWordColors = [Colors.red[900], Colors.lightGreen[900], Colors.amber[900], Colors.lightBlue[900]];
var quizCardElevation = 0.0;


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
class QuizCard extends StatefulWidget {
  QuizCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<QuizCard> createState() => _QuizCardState();
}
class InactiveQuizCard extends StatefulWidget {
  InactiveQuizCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<InactiveQuizCard> createState() => _InactiveQuizCardState();
}
class PauseCard extends StatefulWidget {


  PauseCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index, required this.scrollControlListerner});

  void Function() scrollControlListerner;
  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<PauseCard> createState() => _PauseCardState();
}
class HorizontalScrollCard extends StatefulWidget {
  HorizontalScrollCard({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<HorizontalScrollCard> createState() => _HorizontalScrollCardState();
}
class DefinitionCards extends StatefulWidget {
  DefinitionCards({super.key, required this.cardContent, required this.updateCardFunction, required this.index});

  CardContent cardContent;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;

  @override
  State<DefinitionCards> createState() => _DefinitionCardsState();
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

                    widget.updateCardFunction(type: 4, index: widget.index, updateType: "replace", newCard: newCard);// insert inactive card

                    if(selectedOption==widget.cardContent.answer) {
                      widget.updateCardFunction(updateType: "score"); // increase score
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

class _PauseCardState extends State<PauseCard> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.scrollControlListerner();
        widget.updateCardFunction(index: widget.index, updateType: "remove");
      },
      child: Card(
          child:Center(
            child: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.keyboard_double_arrow_down),
              onPressed: () {
                widget.scrollControlListerner();
                widget.updateCardFunction(index: widget.index, updateType: "remove");
              },
            ),
          ),
      ),
    );
  }
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

class _DefinitionCardsState extends State<DefinitionCards> {

  @override
  Widget build(BuildContext context) {

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: definitionCardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Card(
        elevation: quizCardElevation,
        shadowColor: quizCardShadowColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(widget.cardContent.options[0],
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: headingFont,
                fontFamily: textCardFontFamily,
                color: Colors.red[900]
              )),
            ),
            Text(widget.cardContent.text, textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: headingFont,
              fontFamily: quizCardFontFamily,
              color: definitionFontColor,
            ),),
            const Divider(thickness: 5,),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: widget.cardContent.options.map(
                  (word){
                    return TextButton(
                      style: flatButtonStyle,
                      onPressed: () { },
                      child: Text(word,
                      style: TextStyle(
                        fontFamily: textCardFontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: definitionWordColors[widget.cardContent.options.indexOf(word)%definitionWordColors.length]
                      )),
                    );
                  }
              ).toList(),
            ),
           ]
          ),
        ),
      );
  }
}

class MakeCard extends StatefulWidget {

  MakeCard({super.key, required this.cardContent, required this.index, required this.updateCardFunction,
  required this.scrollControlListerner});

  CardContent cardContent;
  void Function() scrollControlListerner ;
  void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;
  int index;


  @override
  State<MakeCard> createState() => _MakeCardState();
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
    else if(widget.cardContent.type==5){
      return PauseCard(cardContent: widget.cardContent, index: widget.index, updateCardFunction: widget.updateCardFunction, scrollControlListerner: widget.scrollControlListerner);
    }
    else if(widget.cardContent.type==6){
      return HorizontalScrollCard(cardContent: widget.cardContent, updateCardFunction: widget.updateCardFunction, index: widget.index);}
    else if(widget.cardContent.type==7){
      return DefinitionCards(cardContent: widget.cardContent, index: widget.index, updateCardFunction: widget.updateCardFunction );
    }
    else{
      return PauseCard(cardContent: widget.cardContent, index: widget.index, updateCardFunction: widget.updateCardFunction, scrollControlListerner: widget.scrollControlListerner );
    }
  }
}

