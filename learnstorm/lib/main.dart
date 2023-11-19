import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.lightBlue,
        backgroundColor: const Color.fromARGB(255, 168, 222, 247),
        scaffoldBackgroundColor: const Color.fromARGB(255, 168, 222, 247),
        //color: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white, // Set the default text color
            fontWeight: FontWeight.bold,
            fontFamily: 'Sparky',
          ),
        ),
        //primaryColor: Color.fromARGB(255, 245, 147, 0),
      ),
      home: const MyHomePage(title: 'LearnStorm'),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //color: Color.white,
        title: Text('LearnStorm'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Go to the login screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              // Go to the sign-up screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity, // Set width to fill the entire screen
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 132, 203, 236), Color.fromARGB(255, 76, 175, 137)], // Adjust the gradient colors
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Who knew learning could be fun? - We did!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}






class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserHome()),
                );
                // Do something
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Do something
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}


class UserHome extends StatelessWidget {
  const UserHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LearnStorm'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                //color: Colors.blue,
              ),
              child: Text(
                'Your Games',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Coding'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Coding'),
                      content: Text('Learn the principles of coding while helping [NAME] explore an alien planet!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        /*TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GamePage()),
                            );
                          },
                          child: Text('Play'),
                        ),*/           //THIS WILL BE THE 'PLAY BUTTON'
                      ],
                    );
                  }
                );
              }
            ),
            ListTile(
              title: Text('Reading'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Reading'),
                      content: Text('Game info'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        /*TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GamePage()),
                            );
                          },
                          child: Text('Play'),
                        ),*/           //THIS WILL BE THE 'PLAY BUTTON'
                      ],
                    );
                  }
                );
              }
            ),
            ListTile(
              title: Text('Writing'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Writing'),
                      content: Text('Game info'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        /*TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GamePage()),
                            );
                          },
                          child: Text('Play'),
                        ),*/           //THIS WILL BE THE 'PLAY BUTTON'
                      ],
                    );
                  }
                );
              }
            ),
            ListTile(
              title: Text('Math'),
              onTap: () {
                // Show a dialog when "Show Element" is selected
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Math'),
                      content: Text('Game info'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        /*TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GamePage()),
                            );
                          },
                          child: Text('Play'),
                        ),*/           //THIS WILL BE THE 'PLAY BUTTON'
                      ],
                    );
                  }
                );
              }
            ),
            ListTile(
              title: Text('Science'),
              onTap: () {
                // Show a dialog when "Show Element" is selected
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Science'),
                      content: Text('Game info'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        /*TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GamePage()),
                            );
                          },
                          child: Text('Play'),
                        ),*/           //THIS WILL BE THE 'PLAY BUTTON'
                      ],
                    );
                  }
                );
              }
            ),
            ListTile(
              title: Text('History'),
              onTap: () {
                // Show a dialog when "Show Element" is selected
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('History'),
                      content: Text('Game info'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        /*TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GamePage()),
                            );
                          },
                          child: Text('Play'),
                        ),*/           //THIS WILL BE THE 'PLAY BUTTON'
                      ],
                    );
                  }
                );
              }
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to your home page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
//Coding, Reading, Writing, Math, Science, History

