import 'package:drunky_app/screen/create_screen.dart';
import 'package:drunky_app/screen/welcomePage.dart';
import 'package:drunky_app/screen/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //questo widget ci permette di visualizzare la nostra app solo in verticale
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

List<Widget> pages = [Homepage(), CreateScreen()];

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Image.asset('assets/images/logo.png', height: 25.0),
          centerTitle: true,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Homepage'),
            NavigationDestination(icon: Icon(Icons.add), label: 'Create'),
            NavigationDestination(
                icon: Icon(Icons.favorite_outline), label: 'Favorite')
          ],
        ),
        body: pages.elementAt(_selectedIndex));
  }
}
