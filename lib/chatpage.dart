import 'dart:async';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Center(
      //     child: new Text("Chat with a Doc"),
      //   ),
      // ),
      body: new _MyList(),
    );
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemBuilder: (context, i) {
        return new ListTile(
          title: new Text("Doctor"),
          subtitle: new Text(
            "Online",
            style: new TextStyle(color: Colors.green),
          ),
          leading: const Icon(Icons.face),
          trailing: new RaisedButton(
            child: new Text('Remove'),
            onPressed: () {
              deleteDialog(context).then((value) {
                print('Value is $value');
              });
            },
          ),
        );
      },
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Are you sure?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: new Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      });
}
