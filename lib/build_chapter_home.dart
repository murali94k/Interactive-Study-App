import 'package:flutter/material.dart';
import 'Motion.dart';
import 'Time.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.cyan[900],
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 55),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const TimeChapterContent()));
                          },
                          child: const Text(" Measuring Time"),
                        ),
                      ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    decoration: BoxDecoration(
                        color: Colors.cyan[900],
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const MotionChapterContent()));
                        },
                        child: const Text("Motion of Objects"),
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
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          )
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Center(
              child: Text(chapterTitle,
              style: const TextStyle(
                fontFamily: "EXo2",
                fontSize: 40,
                color: Colors.grey,
                fontWeight: FontWeight.bold,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
