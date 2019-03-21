import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF047B7B).withOpacity(0.43),
                const Color(0xFF003077).withOpacity(0.88)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
            
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 150.0),
            Column(
              children: <Widget>[
                Image.asset('assets/logo.png'),
                Text('Healthy Lifestyle for everyone', 
                style:TextStyle(
                  color:Colors.white))
              ],
            ),
            SizedBox(height: 153.0),
            new Image(
              image: AssetImage('assets/symbol.png'),
              fit: BoxFit.cover,      
            ),
          ],
        ),
      ),
    );
  }
}
