import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyPlayerPage();
  }
}

class MyPlayerPage extends StatefulWidget {
  @override
  _MyPlayerPageState createState() => _MyPlayerPageState();
}

class _MyPlayerPageState extends State<MyPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Player"),
        /* trailing: CupertinoButton(
          padding: EdgeInsets.all(0.0),
          child: const Text('返回'),
          onPressed: () {
            Navigator.pop(context);
          },
        ), */
      ),
      child: Container(
        child: Center(
          child: Text('66'),
        ),
      ),
    );
  }
}
