import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './signup.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    String _email;
    String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(child:  Image.asset('assets/doc.jpg', fit: BoxFit.cover),),
         Container( 
           decoration: BoxDecoration(
             gradient: new LinearGradient(
              colors: [
                const Color(0xFF047B7B).withOpacity(0.27),
                const Color(0xFF003077).withOpacity(0.88)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
           ),
         ),
         Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(labelText: 'Email', 
                  labelStyle:TextStyle(color: Colors.white)),
                  
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    setState(() {
                      _email = value;
                    });
                  }),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password',
                labelStyle:TextStyle(color: Colors.white)),
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height: 10.0),RaisedButton(
                  child: Text('Login'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email,
                        password: _password).then((FirebaseUser user) {
                        Navigator.of(context).pushReplacementNamed('dashboard');
                      }).catchError((e) {
                        print(e);
                      });
                },
                ),
                SizedBox(height: 15.0),
                Text('Don\'t have an account?'),
                SizedBox(height: 10.0),
                RaisedButton(
                  child: Text('Sign Up'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed('signup');
                  },
                )
            ],
          ),
          ),
              ],
            ),
    );
  }
}

