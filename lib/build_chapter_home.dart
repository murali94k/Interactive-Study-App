import 'package:flutter/material.dart';
import 'Motion.dart';
import 'Time.dart';
import 'Definitions.dart';
import 'Quiz.dart';
import 'Speed.dart';

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
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90,),
              ChapterTiles(topicContentPage: TimeChapterContent(),
                topicTitle: 'Measure Time', cardAvatarIcon: Icons.alarm, cardColor: Colors.white),
              ChapterTiles(topicContentPage: MotionChapterContent(),
                  topicTitle: 'Motion of Objects', cardAvatarIcon: Icons.directions_run),
              ChapterTiles(topicContentPage: SpeedChapterContent(),
                  topicTitle: 'Motion And Speed', cardAvatarIcon: Icons.speed_sharp),
              ChapterTiles(topicContentPage: DefinitionsChapterContent(),
                  topicTitle: 'Definition Cards', cardAvatarIcon: Icons.auto_stories),
              ChapterTiles(topicContentPage: QuizChapterContent(),
                  topicTitle: 'Take Quiz', cardAvatarIcon: Icons.psychology),
              ChapterTiles(topicContentPage: MotionChapterContent(),
                  topicTitle: 'Activity', cardAvatarIcon: Icons.calculate),
            ],
          )
        ],
      ),
    );
  }
}

class ChapterTiles extends StatelessWidget {
  const ChapterTiles({
    super.key, this.cardColor=Colors.white, required this.topicTitle
   ,required this.cardAvatarIcon, required this.topicContentPage});
  final Color? cardColor;
  final String topicTitle;
  final IconData cardAvatarIcon;
  final Widget topicContentPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> topicContentPage));},
      child: Card(
        margin: const EdgeInsets.symmetric(vertical:10, horizontal: 40),
        elevation: 30,
        color: cardColor,
        shadowColor: Colors.teal[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10,),
          IconButton(
            color: Colors.teal[900],
            iconSize: 30,
            icon: Icon(cardAvatarIcon),
            onPressed: () { }
          ),
            Expanded(
              child: Text(topicTitle, textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'EXo2',
                fontSize: 25,
                color: Colors.cyan[900]
               ),
              ),
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.keyboard_arrow_right),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> topicContentPage)); },
            ),
          ],
        )
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Center(
              child: Text(chapterTitle,
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
