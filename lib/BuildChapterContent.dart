import 'package:flutter/material.dart';
import 'CardContentSchema.dart';
import 'Cards.dart';

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
  final ScrollController _scrollController = ScrollController();

  void scrollControlListerner(){
    if(_scrollController.hasClients){
      _scrollController.animateTo(
        _scrollController.offset+300,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 800),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          title: Text(widget.title),
      ),

      body: ListView.builder(
          controller: _scrollController,
          itemCount: widget.cardLength,
          itemBuilder: (context, index){
            return MakeCard(cardContent: widget.cardContents[index], updateCardFunction: widget.updateCardFunction,
                scrollControlListerner:scrollControlListerner, index: index);
          }),
    );
  }
}
