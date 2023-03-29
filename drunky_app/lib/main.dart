import 'package:drunky_app/screen/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //questo widget ci permette di visualizzare la nostra app solo in verticale
  SystemChrome.setPreferredOrientations([
    DeviceOrientation
        .portraitUp, //nell'array diamo i movimenti che è consentito fare cioè dal basso verso
    DeviceOrientation.portraitDown, //l'alto e viceversa
  ]);
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: WelcomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.lightGreen,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.green[900]),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.favorite_outline, color: Colors.green[900]),
              label: 'Favorite'),
          NavigationDestination(
              icon: Icon(Icons.add, color: Colors.green[900]), label: 'Create'),
          NavigationDestination(
              icon:
                  Icon(Icons.account_circle_outlined, color: Colors.green[900]),
              label: 'Account')
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
