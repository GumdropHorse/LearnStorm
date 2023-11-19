import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Test',
      theme: ThemeData(
        // This is the theme of your application.  
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Game Test'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.


  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Offset position = Offset(0.0, 0.0); //initial position of the square
  Rect targetArea = Rect.fromLTWH(200,300,100,100); //example value
  TextEditingController textController = TextEditingController();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    //show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      //This appears as a black bar on the bottom.
      // Content - message that appears on the bottom
      // Duration - how long the message stays on screen
      SnackBar(
        content: Text('Counter incremented to $_counter'),
        duration: Duration(seconds: 2),
      ),
    );
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    ),
    body: Stack( // Use Stack to layer widgets
      children: <Widget>[
        // Centered Column
        Positioned.fromRect(
          rect: targetArea,
          child: Container(
            color: Colors.green.withOpacity(0.3),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              //Add new text field here
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Enter in the answer',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          )
        ),
        // Draggable red box
        Positioned(
          left: position.dx,
          top: position.dy,  
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                position = Offset(
                  position.dx + details.delta.dx,
                  position.dy + details.delta.dy
                );
              if(targetArea.contains(position)){ //If the green square hits red square
              // It constantly continue
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Square is in the target area!'),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
             
            });
            },
            child: Center(
              child: Container(
                width: 100.0, // Square width
                height: 100.0, // Square height
                color: Colors.red, // Square color
                alignment: Alignment.center, // allign text to center
                child: Text(
                  'Text Here', // your text
                  style: TextStyle(
                    color: Colors.black, // Choose a text color
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );  
}
}
