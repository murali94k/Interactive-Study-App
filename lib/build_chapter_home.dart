import 'package:flutter/material.dart';

import 'main.dart';

class BuildChapterHome extends StatelessWidget {
  const BuildChapterHome({Key? key, required this.title,
    required this.bgImage, required this.chapterTitle}) : super(key: key);

  final String title;
  final String bgImage;
  final String chapterTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: Text(title)),
      body: Stack(
        children: [
          ChapterBackground(bgImage: bgImage, chapterTitle: chapterTitle),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 70),
                      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.cyan[900],
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(20.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChapterContent()));
                          },
                          child: const Text("Get Started"),
                        ),
                      ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ChapterBackground extends StatelessWidget {
  const ChapterBackground({
    super.key,
    required this.bgImage,
    required this.chapterTitle,
  });

  final String bgImage;
  final String chapterTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(bgImage),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          )
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Center(
              child: Text(chapterTitle,
              style: const TextStyle(
                fontFamily: "EXo2",
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
