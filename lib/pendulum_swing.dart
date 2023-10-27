import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';

import 'dart:math';
import 'dart:ui';

class PendulumInfo {
  double length;
  double mass;
  double angle;

  ///Angular Velocity
  double angularVel;

  /// acceleration
  double acc;

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
        this.acc = 1});

  Offset get endPoint =>
      Offset((length * sin(angle)), (length * cos(angle))) + origin;

  @override
  toString() => 'Pendulum has end point at $endPoint';
}

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
        ),
        body: const Center(child: PendulumPlayGround())
    );
  }
}

class PendulumPlayGround extends StatefulWidget {
  const PendulumPlayGround({super.key});

  @override
  State<PendulumPlayGround> createState() => _PendulumPlayGroundState();
}






class _PendulumPlayGroundState extends State<PendulumPlayGround>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  late PendulumSimulationManager pendulumManager;
  double gravity = 9.8;
  double pendulumLength = 140;
  double pendulumMass = 10;
  double pendulumAngle = 30;

  int maxLength = 500;
  int minLength = 30;
  int minMass = 3;
  int maxMass = 100;
  double minGravity = 1;
  double maxGravity = 15;

  int lengthIncrements = 10;
  int massIncrements = 10;
  int gravityIncrements = 1;


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
      pendulumAngle: pendulumAngle * 0.0174533,
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
                        style: TextStyle(
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
                            style: TextStyle(
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
                        child: Text("${gravity.toStringAsFixed(1)}",
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
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    // Reset
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          gravity = 9.8;
                          pendulumLength = 140;
                          pendulumMass = 10;
                          pendulumAngle = 30;
                        });
                      },
                      child: const Text("Reset",
                          style: TextStyle(
                              fontFamily: "EXo2",
                              fontWeight: FontWeight.bold
                          )),
                    ),
                    // Stop
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _animationController.stop();
                        });
                      },
                      child: const Text("Stop",
                          style: TextStyle(
                              fontFamily: "EXo2",
                              fontWeight: FontWeight.bold
                          )),
                    ),// Restart

                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _animationController.repeat();
                    });
                  },
                  child: const Text("Start",
                      style: TextStyle(
                          fontFamily: "EXo2",
                          fontWeight: FontWeight.bold
                      )),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}


class PendulumSwing extends CustomPainter {
  final PendulumSimulationManager pendulumManager;


  PendulumSwing({required this.pendulumManager});

  @override
  void paint(Canvas canvas, Size size) {
    PendulumInfo pendulum = pendulumManager.allPendulum;

    var pendulumBobBrush = Paint()
      ..color = Colors.teal;

    var pendulumSupportBrush = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.fill;

    var stringBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;

    pendulum.origin = Offset(size.width/2, 20);

    canvas.translate(
        pendulumManager.origin.dx, pendulumManager.origin.dy);

    // Draws the line for pendulum 1
    canvas.drawLine(
        pendulum.origin,
        pendulum.endPoint,
        stringBrush);

    // draws fixed support
    double supportWidth = 150;
    double supportHeight = 5;
    canvas.drawRect(Offset(pendulum.origin.dx-supportWidth/2, pendulum.origin.dy-supportHeight/2)
    & Size(supportWidth, supportHeight), pendulumSupportBrush);



    // draws the bob for the first pendulum
    canvas.drawCircle(pendulum.endPoint,
        pendulum.mass, pendulumBobBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
//-------------------- PendulumSimulationManager ------------------------


class PendulumSimulationManager {
  double pendulumLength;
  double pendulumMass;
  double pendulumAngle;
  Offset origin=Offset.zero;
  double gravity;

  PendulumSimulationManager({
    this.origin = Offset.zero,
    required this.gravity,
    this.pendulumLength = 200,
    this.pendulumMass = 6,
    this.pendulumAngle = pi / 4,
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
    );
  }

  void reEstimateAngles() {
    pendulum.angularVel += _simulatedAnglePendulum1(pendulum);
    pendulum.angle += pendulum.angularVel;
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




//
// void main() {
//   runApp(const MaterialApp(
//     home: PlayGroundChapter(),
//   )
//   );
// }