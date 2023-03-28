import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drunky_app/screen/login_page.dart';
import 'package:drunky_app/screen/_registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Image.asset('assets/images/logo.png', height: 25.0),
          centerTitle: true,
          flexibleSpace: Container(),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage())),
                icon: Text('Registrati'))
          ],
        ),
      );
}


// class signIn extends StatefulWidget{
//   const signIn({Key? key}) : super(key: key)

//   @override
//   State<StatefulWidget> createState() => _signInState();
// }

// class _signInState extends State<signIn>{
//   Widget build(BuildContext context) => Card(
//         child: Container(
//           color: Colors.red,
//           width: 300.0,
//           height: 500.0,
//           child: Column(
//             children: [
//               _emailField(),
//               _passwordField(),
//             ],
//           ),
//         ),
//       );
// }

// Widget _emailField() => TextField(
//       keyboardType: TextInputType.emailAddress,
//       style: const TextStyle(
//         fontSize: 16.0,
//         color: Colors.black,
//       ),
//     );

// Widget _passwordField() => TextField();
