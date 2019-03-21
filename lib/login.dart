import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    String _email;
    String _password;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
         Container(decoration:
        BoxDecoration(
          color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/d.jpg')
              )
        ),
         ),
         Container(
           decoration: BoxDecoration(
             gradient: new LinearGradient(
              colors: [
                const Color(0xFF047B7B).withOpacity(0.50),
                const Color(0xFF003077).withOpacity(0.88)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
           ),
         ),
         SizedBox(
         ),
         Container(
           decoration: BoxDecoration(
          color: Colors.transparent,
              image: DecorationImage(
                alignment: Alignment.topRight,
                image: AssetImage('assets/logo.png' ),
           ),
        ),
         ),
         ListView()
      ],
    );
  }
  }
//  RaisedButton(
//                 child: Text('Login'),
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 elevation: 7.0,
//                 onPressed: () {
//                     FirebaseAuth.instance.signInWithEmailAndPassword(
//                       email: _email,
//                       password: _password).then((FirebaseUser user) {
//                       Navigator.of(context).pushReplacementNamed('/homepage');
//                     }).catchError((e) {
//                       print(e);
//                     });
//               }