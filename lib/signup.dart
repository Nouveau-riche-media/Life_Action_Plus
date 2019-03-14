import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import './services/usermanagement.dart';


class SignupPage extends StatefulWidget {
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _firstname;
  String _lastname;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
              TextFormField(
                decoration: InputDecoration(
          labelText: 'Firstname', filled: true, fillColor: Colors.white),
                onSaved: (value) {
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
          labelText: 'Lastname', filled: true, fillColor: Colors.white),
                onSaved: (value) {
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 15.0),

              TextFormField(decoration: InputDecoration(
          labelText: 'E-mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
                onSaved: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Register With Email'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((signedInUser) {
                    UserManagement().storeNewUser(signedInUser, context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              SizedBox(height: 15.0),
              Text('CONFIRM EMAIL'),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.of(context).pushNamed('login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
