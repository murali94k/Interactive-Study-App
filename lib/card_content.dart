class CardContent {

  int type;
  String text ;
  String question ;
  String image;
  List<String> options;
  int answer;
  int selection;
  String explain;

  CardContent({required this.type, this.text="", this.question="",
    this.image="", this.options=const [], this.answer=0, this.explain="", this.selection=0});
}