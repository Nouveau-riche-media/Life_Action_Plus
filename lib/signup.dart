import 'package:flutter/material.dart';

//services
import 'services/usermanagement.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  String _nickName;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        body: ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'FULL NAME',
                            labelStyle: TextStyle(
                               // fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                        onSaved: (val) {
                          _nickName = val;
                        },
                      ),SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                           //     fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                                keyboardType: TextInputType.emailAddress,
                        onSaved: (val) {
                          _email = val;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                             //   fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                        onSaved: (val) {
                          _password = val;
                        },
                        obscureText: true,
                      ),
                      
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _email, password: _password)
                                    .then((signedInUser) {
                                  var userUpdateInfo = new UserUpdateInfo();
                                  userUpdateInfo.displayName = _nickName;
                                  userUpdateInfo.photoUrl =
                                      'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg';
                                  //FirebaseAuth.instance
                                   //    .updateProfile(userUpdateInfo)
                                     // .then((user) {
                                    FirebaseAuth.instance
                                        .currentUser()
                                        .then((user) {
                                      UserManagement()
                                          .storeNewUser(user, context);
                                    }).catchError((e) {
                                      print(e);
                                    });
                                  }).catchError((e) {
                                    print(e);
                                  });
                                // }).catchError((e) {
                                //   print(e);
                                // });
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                   //   fontFamily: 'Montserrat'
                                   ),
                                ),
                                
                              ),
                            ),
                            
                          )),
                          SizedBox(height: 15.0),
                Text('Own an account?'),
                SizedBox(height: 10.0),
                RaisedButton(
                  child: Text('Log in'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed('login');
                  },
                )
                    ],
                  )),
            ]));
  }
}
