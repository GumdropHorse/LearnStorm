import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../main.dart';

class ProgramGame extends StatelessWidget {
  const ProgramGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Game',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Color.fromARGB(255, 81, 81, 81),
        backgroundColor: const Color.fromARGB(255, 81, 81, 81),
        scaffoldBackgroundColor: const Color.fromARGB(255, 81, 81, 81),
        //color: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white, // Set the default text color
            fontWeight: FontWeight.bold,
            fontFamily: 'Serif',
          ),
        ),
        //primaryColor: Color.fromARGB(255, 245, 147, 0),
      ),
      home: const MyProgramGame(title: '',),
    );
  }
}


class MyProgramGame extends StatefulWidget {
  


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.


  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  final String title;

  const MyProgramGame({super.key, required this.title});


  @override
  State<MyProgramGame> createState() => _MyProgramGameState();
}


class _MyProgramGameState extends State<MyProgramGame> {
  /*int _counter = 0;


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/
  String talking = 'Hi, I need your help. I crashed on an alien planet.';
  late List<String> static; static const all_possible_code = ["print()","move()","moveBack()","search()","turn()","open()"];
  List<int> inventory = [0,0,0,0,0,0];
  String robot = 'assets/invis.png';
  //bool isPaused = false;

  @override
  void initState() {
    super.initState();
    // Start a timer when the widget is created
    startTimer();
  }

  void startTimer() {
    // Create a timer that fires after 5 seconds
    Timer(Duration(seconds: 6), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'Oh look, I just found a function!';
      });
    });
    Timer(Duration(seconds: 11), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'Functions are multiple lines of code turned into one command.';
      });
    });
    Timer(Duration(seconds: 17), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'This function is print().';
        inventory[0]++;
        //inventory.add(all_possible_code.elementAt(0));
      });
    });
    Timer(Duration(seconds: 21), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'Can you use print to help me call out to my friend?';
      });
    });
    Timer(Duration(seconds: 27), () {
      // Update the text when the timer goes off
      setState(() {
        robot = 'assets/robofriend.png';
        talking = 'Oh! There he is!';
        inventory[0]--;
        //inventory.removeAt(0);
      });
    });
    Timer(Duration(seconds: 31), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'He can help us get out of here.';
      });
    });
    Timer(Duration(seconds: 36), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'Unfortunately, he only speaks in binary.';
      });
    });
    Timer(Duration(seconds: 41), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'Luckily, code that we give him can be translated to binary!';
      });
    });
    Timer(Duration(seconds: 47), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'We just need to find some more functions...';
      });
    });
    Timer(Duration(seconds: 51), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'Ah, here is one!';
      });
    });
    Timer(Duration(seconds: 55), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'This is move(). Use move() to make our friend move forward!';
        inventory[1]++;
      });
    });
    Timer(Duration(seconds: 61), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'Oh look! The robot found a door! Tell him to open it with open().';
      });
    });
    Timer(Duration(seconds: 67), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'A new room! Using the functions in your inventory below,';
        inventory[1]--;
      });
    });
    Timer(Duration(seconds: 73), () {
      // Update the text when the timer goes off
      setState(() {
        talking = 'can you help our friend find the key in the next room?';
      });
    });
    Timer(Duration(seconds: 80), () {
      // Update the text when the timer goes off
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProgramLevel2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/astronaut.png', // Replace with your image path
                  width: 200.0, // Adjust width as needed
                  height: 200.0, // Adjust height as needed
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Image.asset(
                  robot, // Replace with your image path
                  width: 200.0, // Adjust width as needed
                  height: 200.0, // Adjust height as needed
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              talking,
            ),
            SizedBox(height: 50),
            Table(
              children: [
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text(all_possible_code.elementAt(0))),),
                    TableCell(child: Center(child: Text(all_possible_code.elementAt(1))),),
                    TableCell(child: Center(child: Text(all_possible_code.elementAt(2))),),
                    TableCell(child: Center(child: Text(all_possible_code.elementAt(3))),),
                    TableCell(child: Center(child: Text(all_possible_code.elementAt(4))),),
                    TableCell(child: Center(child: Text(all_possible_code.elementAt(5))),),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text(inventory.elementAt(0).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(1).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(2).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(3).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(4).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(5).toString())),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramLevel2 extends StatefulWidget{
  ProgramLevel2({super.key});
  /*@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }*/
  @override
  State<ProgramLevel2> createState() => _ProgramLevel2State();
}

class _ProgramLevel2State extends State<ProgramLevel2> {
  
  String talking = 'I will give you some functions to help you out.';
  late List<String> static; static const all_possible_code = ["print()","move()","moveBack()","search()","turn()","open()"];
  List<int> inventory = [0,4,0,3,0,1];
  String robot = 'assets/robofriend.png';
  String robo1 = 'assets/invis.png';
  String robo2 = 'assets/invis.png';
  String robo3 = 'assets/invis.png';
  String robo4 = 'assets/invis.png';
  String current_robo = 'assets/robofriend.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  robot, // Replace with your image path
                  width: 200.0, // Adjust width as needed
                  height: 200.0, // Adjust height as needed
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/box.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo1, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/box.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo2, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/box.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo3, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/door.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo4, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              talking,
            ),
            SizedBox(height: 50),
            Table(
              children: [
                TableRow(
                  children: [
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                      },
                      child: Text(all_possible_code.elementAt(0)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        setState(() {
                          inventory[1]--;
                          if(robot != 'assets/invis.png'){
                            robot = 'assets/invis.png';
                            robo1 = 'assets/robofriend.png';
                          }else if(robo1 != 'assets/invis.png'){
                            robo1 = 'assets/invis.png';
                            robo2 = current_robo;
                          }else if(robo2 != 'assets/invis.png'){
                            robo2 = 'assets/invis.png';
                            robo3 = current_robo;
                          }else if(robo3 != 'assets/invis.png'){
                            robo3 = 'assets/invis.png';
                            robo4 = current_robo;
                          }
                        });
                      },
                      child: Text(all_possible_code.elementAt(1)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                      },
                      child: Text(all_possible_code.elementAt(2)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                        Random random = Random();
                        int randomNumber = random.nextInt(1);
                        setState(() {
                          inventory[3]--;
                          if(robo1 != 'assets/invis.png'){
                            if(randomNumber == 1){
                              current_robo = 'assets/keyrobo.png';
                              robo1 = current_robo;
                              print('Test');
                            }
                          }else if(robo2 != 'assets/invis.png' && current_robo != 'assets/keyrobo.png'){
                            if(randomNumber == 1){
                              current_robo = 'assets/keyrobo.png';
                              robo2 = current_robo;
                            }
                          }else if(robo3 != 'assets/invis.png' && current_robo != 'assets/keyrobo.png'){
                            current_robo = 'assets/keyrobo.png';
                            robo3 = current_robo;
                          }
                        });
                      },
                      child: Text(all_possible_code.elementAt(3)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                      },
                      child: Text(all_possible_code.elementAt(4)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        // Next Level
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProgramLevel3()),
                        );
                      },
                      child: Text(all_possible_code.elementAt(5)),
                    ),),),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text(inventory.elementAt(0).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(1).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(2).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(3).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(4).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(5).toString())),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class ProgramLevel3 extends StatefulWidget{
  ProgramLevel3({super.key});
  /*@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }*/
  @override
  State<ProgramLevel3> createState() => _ProgramLevel3State();
}

class _ProgramLevel3State extends State<ProgramLevel3> {
  
  String talking = 'Thank you for your help! You have reached the end, now dance!';
  late List<String> static; static const all_possible_code = ["print()","move()","moveBack()","search()","turn()","open()"];
  List<int> inventory = [0,100,100,0,100,0];
  String robot = 'assets/invis.png';
  String robo1 = 'assets/invis.png';
  String robo2 = 'assets/robofriend.png';
  String robo3 = 'assets/invis.png';
  String robo4 = 'assets/invis.png';
  String current_robo = 'assets/robofriend.png';
  bool turn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  robot, // Replace with your image path
                  width: 200.0, // Adjust width as needed
                  height: 200.0, // Adjust height as needed
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/invis.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo1, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/invis.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo2, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/invis.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo3, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
                SizedBox(width: 16.0), // Adjust spacing between images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/invis.png', // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                    Image.asset(
                      robo4, // Replace with your image path
                      width: 200.0, // Adjust width as needed
                      height: 200.0, // Adjust height as needed
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              talking,
            ),
            SizedBox(height: 50),
            Table(
              children: [
                TableRow(
                  children: [
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                      },
                      child: Text(all_possible_code.elementAt(0)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        setState(() {
                          inventory[1]--;
                          if(!turn){
                            if(robot != 'assets/invis.png'){
                              robot = 'assets/invis.png';
                              robo1 = 'assets/robofriend.png';
                            }else if(robo1 != 'assets/invis.png'){
                              robo1 = 'assets/invis.png';
                              robo2 = current_robo;
                            }else if(robo2 != 'assets/invis.png'){
                              robo2 = 'assets/invis.png';
                              robo3 = current_robo;
                            }else if(robo3 != 'assets/invis.png'){
                              robo3 = 'assets/invis.png';
                              robo4 = current_robo;
                            }
                          }else{
                            if(robo4 != 'assets/invis.png'){
                              robo4 = 'assets/invis.png';
                              robo3 = 'assets/robofriend.png';
                            }else if(robo3 != 'assets/invis.png'){
                              robo3 = 'assets/invis.png';
                              robo2 = current_robo;
                            }else if(robo2 != 'assets/invis.png'){
                              robo2 = 'assets/invis.png';
                              robo1 = current_robo;
                            }else if(robo1 != 'assets/invis.png'){
                              robo1 = 'assets/invis.png';
                              robot = current_robo;
                            }
                          }
                        });
                      },
                      child: Text(all_possible_code.elementAt(1)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                        setState(() {
                          inventory[2]--;
                          if(turn){
                            if(robot != 'assets/invis.png'){
                              robot = 'assets/invis.png';
                              robo1 = 'assets/robofriend.png';
                            }else if(robo1 != 'assets/invis.png'){
                              robo1 = 'assets/invis.png';
                              robo2 = current_robo;
                            }else if(robo2 != 'assets/invis.png'){
                              robo2 = 'assets/invis.png';
                              robo3 = current_robo;
                            }else if(robo3 != 'assets/invis.png'){
                              robo3 = 'assets/invis.png';
                              robo4 = current_robo;
                            }
                          }else{
                            if(robo4 != 'assets/invis.png'){
                              robo4 = 'assets/invis.png';
                              robo3 = 'assets/robofriend.png';
                            }else if(robo3 != 'assets/invis.png'){
                              robo3 = 'assets/invis.png';
                              robo2 = current_robo;
                            }else if(robo2 != 'assets/invis.png'){
                              robo2 = 'assets/invis.png';
                              robo1 = current_robo;
                            }else if(robo1 != 'assets/invis.png'){
                              robo1 = 'assets/invis.png';
                              robot = current_robo;
                            }
                          }
                        });
                      },
                      child: Text(all_possible_code.elementAt(2)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                      },
                      child: Text(all_possible_code.elementAt(3)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        //Do something
                        if(turn){
                          turn = false;
                        }else{
                          turn = true;
                        }
                      },
                      child: Text(all_possible_code.elementAt(4)),
                    ),),),
                    TableCell(child: Center(child: TextButton(
                      onPressed: () {
                        // Do something
                      },
                      child: Text(all_possible_code.elementAt(5)),
                    ),),),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text(inventory.elementAt(0).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(1).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(2).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(3).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(4).toString())),),
                    TableCell(child: Center(child: Text(inventory.elementAt(5).toString())),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                //Do something
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserHome()),
                );
              },
              child: Text("Finish"),
            ),
          ],
        ),
      ),
    );
  }

}