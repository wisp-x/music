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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.arrow_back_ios),
              Text('Back')
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        middle: Text("Player"),
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
