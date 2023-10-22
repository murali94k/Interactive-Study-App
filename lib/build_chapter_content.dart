import 'package:flutter/material.dart';
import 'card_content.dart';
import 'cards.dart';

class BuildChapterContent extends StatefulWidget {
  const BuildChapterContent({super.key, required this.title, required this.topic, required this.cardContents,
    required this.updateCardFunction, required this.cardLength});

  final String title;
  final String topic;
  final List<CardContent> cardContents;
  final int cardLength;

  final void Function({dynamic index, dynamic type, dynamic updateType, dynamic newCard}) updateCardFunction;

  @override
  State<BuildChapterContent> createState() => _BuildChapterContentState();
}

class _BuildChapterContentState extends State<BuildChapterContent> {


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          title: Text(widget.title),
      ),

      body: ListView.builder(
          itemCount: widget.cardLength,
          itemBuilder: (context, index){
            return MakeCard(cardContent: widget.cardContents[index], updateCardFunction: widget.updateCardFunction, index: index);
          }),
    );
  }
}
