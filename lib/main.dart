import 'package:flutter/material.dart';
import 'build_chapter_home.dart';

class ChapterHome extends StatelessWidget {
  const ChapterHome({super.key});


  @override
  Widget build(BuildContext context) {
    return const BuildChapterHome(title: "Physics", bgImage: "https://drive.google.com/uc?export=view&id=17tK3dhOAaIGtTQna-wFrl7w1oVytFX71",
        chapterTitle: "Time And Motion");
  }
}


void main() {
  runApp(const MaterialApp(
    home: ChapterHome(),
   )
  );
}