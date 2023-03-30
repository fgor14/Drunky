import 'package:drunky_app/screen/login_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.all(100.0),
          color: Colors.green,
          child: Column(
            children: [
              welcomeWidget(), //questo widget serve per contenere il logo dell'app
              signInButton(
                  context), //questo widget contiene il tasto per passare alla pagina di log in
            ],
          ),
        ),
      );

  Widget welcomeWidget() => Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.fitWidth,
          ),
        ]),
      ); //expanded ci consente di occupare tutto lo spazio all'interno della column

  Widget signInButton(BuildContext context) => ElevatedButton(
        child: Text('INIZIA'),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  LoginPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
      );
}
