import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'games/programming/game.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import '../user_auth/firebase_auth_implementation.dart';


/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}*/
Future<void> main() async {    
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}  


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/user': (context) => UserHome(),
        //'/second': (context) => SecondScreen(),
        // Add more named routes as needed
      },
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
        primarySwatch: Colors.deepPurple,
        backgroundColor: Color.fromARGB(255, 241, 71, 250),
        //scaffoldBackgroundColor: const Color.fromARGB(255, 168, 222, 247),
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
      body: Stack(
        fit: StackFit.expand,
        children:[
            Image.asset(
              'assets/galaxy_back.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                SizedBox(height: 120),
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text('Who knew learning could be fun? - We did!',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
        ],
      ),
    );
  }
}






class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
              'assets/galaxy_back.png', // Replace with your image asset
              fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color:Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color:Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _signIn(context);
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserHome()),
                    );*/
                    // Do something
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _signIn(BuildContext context) async {

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      //showToast(message: "User is successfully signed in");
      Navigator.pushNamed(context, "/user");
    } else {
      //do something
    }
  }
}


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    //super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
              'assets/galaxy_back.png', // Replace with your image asset
              fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color:Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color:Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color:Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Do something
                    _signUp(context);
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _signUp(BuildContext context) async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    User? user = await _auth.signUpWithEmailAndPassword(password,email);
    if (user != null) {
      //showToast(message: "User is successfully created");
      Navigator.pushNamed(context, "/user");
    } else {
      //showToast(message: "Some error happend");
    }
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
        backgroundColor: Colors.deepPurple,
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
              title: Text('Planet Code',style: TextStyle(color: Colors.white,),),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Planet Code'),
                      content: Text('Learn the principles of coding while helping Astro explore an alien planet!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProgramGame()),
                            );
                          },
                          child: Text('Play'),
                        ),           //THIS WILL BE THE 'PLAY BUTTON'
                      ],
                    );
                  }
                );
              }
            ),
            ListTile(
              title: Text('Proper Mars',style: TextStyle(color: Colors.white,),),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Proper Mars'),
                      content: Text('Learn about proper nouns on Mars with Ray! COMING SOON!'),
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
              title: Text('Type it Up',style: TextStyle(color: Colors.white,),),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Type it Up'),
                      content: Text('Quick! The International Space Station needs your help! COMING SOON!'),
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
              title: Text('Counting Stars',style: TextStyle(color: Colors.white,),),
              onTap: () {
                // Show a dialog when "Show Element" is selected
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Counting Stars'),
                      content: Text('Count the constellations. COMING SOON!'),
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
              title: Text('Rock Star',style: TextStyle(color: Colors.white,),),
              onTap: () {
                // Show a dialog when "Show Element" is selected
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Rock Star'),
                      content: Text('Discover new things about rocks in space. COMING SOON!'),
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
              title: Text('Discovery Race',style: TextStyle(color: Colors.white,),),
              onTap: () {
                // Show a dialog when "Show Element" is selected
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Discovery Race'),
                      content: Text('Help Dorian uncover the ancient secrets of how people have viewed the solar system. COMING SOON!'),
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
              'assets/galaxy_back.png', // Replace with your image asset
              fit: BoxFit.cover,
          ),
          const Center(
            child: Text(
              'Welcome Rachel!',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
//Coding, Reading, Writing, Math, Science, History

