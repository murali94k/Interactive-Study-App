import 'package:flutter/material.dart';
import 'dart:math';

class PendulumInfo {
  double length;
  double mass;
  double angle;

  ///Angular Velocity
  double angularVel;

  /// acceleration
  double acc;

  double oscillations;
  final stopwatch = Stopwatch();
  double totalTime;
  double amplitude;

  // Canvas related
  Color paintColor = Colors.black;
  Offset origin;
  List<Offset> trailPoints = [];

  PendulumInfo(
      {required this.length,
        required this.mass,
        required this.angle,
        required this.origin,
        this.angularVel = 1,
        this.acc = 1,
        this.oscillations=0,
        required this.amplitude,
      this.totalTime=0});

  Offset get endPoint =>
      Offset((length * sin(angle)), (length * cos(angle))) + origin;

  @override
  toString() => 'Pendulum has end point at $endPoint';
}

// ------- PlayGroundChapter --------------------------------
class PlayGroundChapter extends StatefulWidget {
  const PlayGroundChapter({super.key});
  @override
  State<PlayGroundChapter> createState() => _PlayGroundChapterState();
}
class _PlayGroundChapterState extends State<PlayGroundChapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pendulum"),
          backgroundColor: Colors.cyan[900],
        ),
        body: const Column(
          children: [
            Expanded(
              flex: 5,
                child: Center(child: PendulumPlayGround())
            ),
              Divider(thickness: 10,),
              Expanded(
                flex: 3,
                  child:ActivityCards()
              ),
          ],
        )
    );
  }
}


// ---------- PendulumPlayGround --------------------------------
class PendulumPlayGround extends StatefulWidget {
  const PendulumPlayGround({super.key});

  @override
  State<PendulumPlayGround> createState() => _PendulumPlayGroundState();
}
class _PendulumPlayGroundState extends State<PendulumPlayGround>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  late PendulumSimulationManager pendulumManager;
  double oscillations = 0;

  double gravity = 9.8;
  double pendulumLength = 160;
  double pendulumMass = 10;
  double pendulumAngle = 30;//degrees
  double totalTime=0;


  int maxLength = 370;
  int minLength = 30;
  int minMass = 12;
  int maxMass = 100;
  double minGravity = 1;
  double maxGravity = 15;

  int lengthIncrements = 10;
  int massIncrements = 10;
  double gravityIncrements = 0.2;

  bool stopTimer = false;

  @override
  void initState() {
    super.initState();
    // Initializing the animation controller with a defined duraion.
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

  }

  @override
  Widget build(BuildContext context) {

    pendulumManager = PendulumSimulationManager(
      gravity: gravity / 60, //Dividing gravity accross frames, assuming 60 FPS.
      pendulumLength: pendulumLength,
      pendulumMass: pendulumMass,
      pendulumAngle: pendulumAngle * 0.0174533,// radians
      oscillations: oscillations,
      totalTime: totalTime,
        stopTimer: stopTimer
    );
    pendulumManager.initializePendulum();

    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, _){
                  pendulumManager.reEstimateAngles();
                  return CustomPaint(
                    painter: PendulumSwing(pendulumManager: pendulumManager),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Length
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {  },
                  child: const Text("String Length",
                  style: TextStyle(
                    fontFamily: "EXo2",
                    fontWeight: FontWeight.bold
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    IconButton(color:Colors.red,onPressed: (){
                      setState(() {
                        if(pendulumLength>minLength){
                          pendulumLength -=lengthIncrements;
                        }
                      });
                    }, icon: const Icon(Icons.remove, size: 15)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("$pendulumLength",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "EXo2"
                        ))),
                    IconButton(
                        color: Colors.blue, onPressed: (){
                      setState(() {
                        if(pendulumLength<maxLength){
                          pendulumLength +=lengthIncrements;
                        }
                      });
                    }, icon: const Icon(Icons.add,size: 18,))
                  ],
                ),
                // Mass
                const Divider(
                  thickness: 2,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {  },
                  child: const Text("Bob Mass",
                      style: TextStyle(
                          fontFamily: "EXo2",
                          fontWeight: FontWeight.bold
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(color:Colors.red,onPressed: (){
                      setState(() {
                        if(pendulumMass>minMass){
                          pendulumMass -=massIncrements;
                        }
                      });
                    }, icon: const Icon(Icons.remove, size: 15)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("$pendulumMass",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "EXo2"
                            ))),
                    IconButton(
                        color: Colors.blue, onPressed: (){
                      setState(() {
                        if(pendulumMass<maxMass){
                          pendulumMass +=massIncrements;
                        }
                      });
                    }, icon: const Icon(Icons.add,size: 18,))
                  ],
                ),
                // Gravity
                const Divider(
                  thickness: 2,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {  },
                  child: const Text("Gravity",
                      style: TextStyle(
                          fontFamily: "EXo2",
                          fontWeight: FontWeight.bold
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(color:Colors.red,onPressed: (){
                      setState(() {
                        if(gravity>minGravity){
                          gravity -=gravityIncrements;
                        }
                      });
                    }, icon: const Icon(Icons.remove, size: 15)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(gravity.toStringAsFixed(1),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "EXo2"
                            ))),
                    IconButton(
                        color: Colors.blue, onPressed: (){
                      setState(() {
                        if(gravity<maxGravity){
                          gravity +=gravityIncrements;
                        }
                      });
                    }, icon: const Icon(Icons.add,size: 18,))
                  ],
                ),
                // Settings
                const Divider(
                  thickness: 2,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    // stop
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _animationController.stop();
                          oscillations = pendulumManager.allPendulum.oscillations;
                          pendulumAngle = pendulumManager.allPendulum.angle/ 0.0174533;
                          totalTime = pendulumManager.pendulum.totalTime;
                          stopTimer=true;
                        });
                      },
                      child: const Text(" Stop ",
                          style: TextStyle(
                              fontFamily: "EXo2",
                              fontWeight: FontWeight.bold
                          )),
                    ),
                    // Start
                    const SizedBox(width: 10,),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        backgroundColor: Colors.green[600],
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _animationController.repeat();
                          pendulumManager.pendulum.stopwatch.start();
                          totalTime = pendulumManager.pendulum.totalTime;
                          stopTimer = false;
                        });
                      },
                      child: const Text(" Start ",
                          style: TextStyle(
                              fontFamily: "EXo2",
                              fontWeight: FontWeight.bold
                          )),
                    ),
                    const SizedBox(width: 10,),
                    // Reset
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          gravity = 9.8;
                          pendulumLength = 160;
                          pendulumMass = 10;
                          pendulumAngle = 30;
                          oscillations=0;
                          totalTime=0;
                        });
                      },
                      child: const Text(" Reset ",
                          style: TextStyle(
                              fontFamily: "EXo2",
                              fontWeight: FontWeight.bold
                          )),
                    ),
                  ],
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}


//--------- PendulumSwing Canvas ----------------------------------
class PendulumSwing extends CustomPainter {
  final PendulumSimulationManager pendulumManager;


  PendulumSwing({required this.pendulumManager});

  @override
  void paint(Canvas canvas, Size size) {
    PendulumInfo pendulum = pendulumManager.allPendulum;

    var pendulumBobBrush = Paint()
      ..color = Colors.teal;

    var pendulumSupportBrush = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    var stringBrush = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    pendulum.origin = Offset(size.width/2+20, 60);

    canvas.translate(
        pendulumManager.origin.dx, pendulumManager.origin.dy);

    // Draws the line for pendulum 1
    canvas.drawLine(
        pendulum.origin,
        pendulum.endPoint,
        stringBrush);

    // draws fixed support
    double supportWidth = 50;
    double supportHeight = 10;
    canvas.drawRect(Offset(pendulum.origin.dx-supportWidth/2, pendulum.origin.dy-supportHeight/2)
    & Size(supportWidth, supportHeight), pendulumSupportBrush);

    // draws the bob for the first pendulum
    canvas.drawCircle(pendulum.endPoint,
        pendulum.mass, pendulumBobBrush);

    // Text output oscillations and time
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: "EXo2",
      fontWeight: FontWeight.bold
    );

    final textSpan = TextSpan(
      text: 'Oscillation: ${pendulum.oscillations}    Time: ${pendulum.totalTime.round()}   ',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (pendulum.origin.dx-textPainter.width/2);
    final yCenter = (pendulum.origin.dy -10-textPainter.height);
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

// -------- PendulumSimulationManager ----------------------------
class PendulumSimulationManager {
  double pendulumLength;
  double pendulumMass;
  double pendulumAngle;
  Offset origin=Offset.zero;
  double gravity;
  double totalTime;
  double oscillations;
  bool stopTimer=true;

  PendulumSimulationManager({
    this.origin = Offset.zero,
    required this.gravity,
    this.pendulumLength = 200,
    this.pendulumMass = 6,
    this.pendulumAngle = pi / 4 ,
    this.totalTime=0,
    this.oscillations=0,
    this.stopTimer=true
  });

  late PendulumInfo pendulum ;

  void initializePendulum() {
    pendulum = PendulumInfo(
      angle: pendulumAngle,
      length: pendulumLength,
      mass: pendulumMass,
      origin: Offset.zero,
      angularVel: 0,
      acc: 0,
      oscillations: oscillations,
      amplitude: pendulumAngle,
      totalTime: totalTime,
    );
    if(stopTimer==true) {
      pendulum.stopwatch.stop();
    }
    else{
      pendulum.stopwatch.start();
    }
  }


  void reEstimateAngles() {
    pendulum.angularVel += _simulatedAnglePendulum1(pendulum);
    pendulum.angle += pendulum.angularVel;
    if(pendulum.angle>=(pendulum.amplitude).abs()){
      pendulum.oscillations += 1;
      if(stopTimer==false){
        pendulum.totalTime = (pendulum.stopwatch.elapsedMilliseconds/1000);
      }
    }


  }

  double _simulatedAnglePendulum1(PendulumInfo pendulum) {
    PendulumInfo p1 = pendulum;

    // print("----angle---${sin(p1.angle)}");

    double numerator = -gravity * sin(p1.angle);

    double denominator = p1.length;

    return numerator / denominator;
  }

  PendulumInfo get allPendulum => pendulum;
}

// ------------ Activity cards---------------------------------------

List <ActivityContent> activities = [
  ActivityContent(title:"Welcome to Pendulum PlayGround !", instructions:"\n\nThis is your instruction section, make sure to read it before every activity task.",
    question:"\nHere is your activity Question section to try out. "),
  ActivityContent(title:"Get Started !", instructions:"Ensure to grab your LAB Workbook and pen",
      question:"\nREADY? Let's get started ... "),
  ActivityContent(title:"Observe !", instructions:"\n\nBefore we move to LAB activities spend some time, play with the buttons on the right, see how the simple pendulum behaves...",
    question:"\n  Found anything interesting ?"),

  ActivityContent(title:"Time Period", instructions:"1. Press STOP and RESET the pendulum.\n2. Make two columns (String Length, Time Period)\n3. press START and note down the values",
    question: "\n What is the TIME PERIOD of the pendulum?"),

  ActivityContent(title:"Caution !", instructions: "\n\n While calculating TIME PERIOD make sure you wait for at least 3 oscillations then calculate as follows",
  question: "TIME PERIOD = (Number of OSCILLATIONS) / (TIME)"),

  ActivityContent(title:"Time Period And Length", instructions:"1. Press STOP and RESET the pendulum.\n2. INCREASE the STRING LENGTH of pendulum and Note down TIME PERIOD",
    question: "Note down the TIME PERIOD of the pendulum for lengths - 30, 60, 120, 240, 270"),
  ActivityContent(title:"Time Period And Length", instructions:"1. From the readings noted for various String Length values",
    question: "How the TIME PERIOD of the pendulum is varying when you increase the String Length ?\n Is it Increasing or Decreasing with Increase in Length ?"),
  ActivityContent(title:"Time Period And Length", instructions:"1. From the readings noted for various String Length values",
      question: "Can you notice any pattern in values of TIME PERIOD vs String Length ?"),

  ActivityContent(title:"Time Period And Mass", instructions:"1. Press STOP and RESET the pendulum.\n2. INCREASE the MASS of Bob of pendulum and Note down TIME PERIOD",
      question: "Note down the TIME PERIOD of the pendulum for Mass - 10, 20, 30, 40, 50, 60, 70"),
  ActivityContent(title:"Time Period And Mass", instructions:"1. From the readings noted for various MASS values",
      question: "How the TIME PERIOD of the pendulum is varying when you increase the MASS ? Is it Increasing or Decreasing with Increase in MASS ?"),


  ActivityContent(title:"Time Period And Gravity", instructions:"1. Press STOP and RESET the pendulum.\n2. INCREASE the GRAVITY force acting on the pendulum and Note down TIME PERIOD",
      question: "Note down the TIME PERIOD of the pendulum for GRAVITY - 0.8, 1.6, 3.2, 6.4, 7.2"),
  ActivityContent(title:"Time Period And Gravity", instructions:"1. From the readings noted for various GRAVITY values",
      question: "How the TIME PERIOD of the pendulum is varying when you increase the GRAVITY ? Is it Increasing or Decreasing with Increase in GRAVITY ?"),
  ActivityContent(title:"Time Period And Mass", instructions:"1. From the readings noted for various MASS values",
      question: "Can you notice any pattern in values of TIME PERIOD vs GRAVITY force on pendulum ?"),

  ActivityContent(title:"Factors", instructions:"Think ...", question: "Think of any OTHER FACTORS affecting the time period of Simple Pendulum ?"),

  ActivityContent(title:"Initial Force", instructions:"Think ...", question: "How about Giving initial PUSH to the Bob at Start ?"),

  ActivityContent(title:"Slow Down", instructions:"1. STOP and RESET the pendulum and START\n2. STOP the pendulum close to EQUILIBRIUM (Not exactly at equilibrium)\n3. Now START",
      question: "Notice that now the pendulum Oscillates at lesser speed than initial ? Do you notice ANY CHANGE in TIME PERIOD ?"),

  ActivityContent(title:"Finish !", question: "Congratulation reaching to the Finish line !"),


];

class ActivityCards extends StatefulWidget {
  const ActivityCards({super.key});

  @override
  State<ActivityCards> createState() => _ActivityCardsState();
}

class _ActivityCardsState extends State<ActivityCards> {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[900],
      child: PageView.builder(
        itemCount: activities.length,
        controller: PageController(viewportFraction: 0.9),
        onPageChanged: (int index) => setState(() => _index = index),
        itemBuilder: (_, i) {
          return Transform.scale(
            scale: i == _index ? 1 : 0.9,
            child: Card(
              elevation: 30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(activities[i].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "EXo2",
                      fontSize: 20,
                      color: Colors.black
                      ),
                    )
                  ),
                  Text(activities[i].instructions,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "EXo2",
                    fontSize: 14, color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),),
                  const SizedBox(height: 10,),
                  Text(activities[i].question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "EXo2",
                        fontSize: 18, color: Colors.teal[900],
                        fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ActivityContent {
  String title;
  String instructions;
  String question;
  String hint;

  ActivityContent({required this.title, this.instructions="", this.question="", this.hint=""});
}