import 'package:drunky_app/screen/app.dart';
import 'package:drunky_app/screen/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //questo widget ci permette di visualizzare la nostra app solo in verticale
  SystemChrome.setPreferredOrientations([
    DeviceOrientation
        .portraitUp, //nell'array diamo i movimenti che è consentito fare cioè dal basso verso
    DeviceOrientation.portraitDown, //l'alto e viceversa
  ]);
  runApp(App());
}
