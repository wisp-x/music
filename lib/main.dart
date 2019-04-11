import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      home: MyHomePage(title: 'Music'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _type = 'netease';

  TextEditingController _textController;

  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Music"),
        trailing: CupertinoButton(
          padding: EdgeInsets.all(0.0),
          child: const Text('关于'),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('关于本软件'),
                  content: const Text('巴拉巴拉巴拉吧'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text('知道了'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: _type == 'netease' ? 80.0 : 60.0,
                    height: _type == 'netease' ? 80.0 : 60.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundImage:
                            AssetImage('assets/images/netease.jpg'),
                      ),
                      onTap: () {
                        setState(() {
                          _type = 'netease';
                        });
                      },
                    ),
                  ),
                  Container(
                    width: _type == 'tencent' ? 80.0 : 60.0,
                    height: _type == 'tencent' ? 80.0 : 60.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundImage:
                            AssetImage('assets/images/tencent.jpg'),
                      ),
                      onTap: () {
                        setState(() {
                          _type = 'tencent';
                        });
                      },
                    ),
                  ),
                  Container(
                    width: _type == 'xiami' ? 80.0 : 60.0,
                    height: _type == 'xiami' ? 80.0 : 60.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundImage: AssetImage('assets/images/xiami.jpg'),
                      ),
                      onTap: () {
                        setState(() {
                          _type = 'xiami';
                        });
                      },
                    ),
                  ),
                  Container(
                    width: _type == 'kugou' ? 80.0 : 60.0,
                    height: _type == 'kugou' ? 80.0 : 60.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundImage: AssetImage('assets/images/kugou.jpg'),
                      ),
                      onTap: () {
                        setState(() {
                          _type = 'kugou';
                        });
                      },
                    ),
                  ),
                  Container(
                    width: _type == 'baidu' ? 80.0 : 60.0,
                    height: _type == 'baidu' ? 80.0 : 60.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: GestureDetector(
                      child: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundImage: AssetImage('assets/images/baidu.jpg'),
                      ),
                      onTap: () {
                        setState(() {
                          _type = 'baidu';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0),
                child: CupertinoTextField(
                  cursorColor: Colors.white,
                  controller: _textController,
                  placeholder: '输入歌曲名称搜索\\（￣︶￣）/',
                  keyboardType: TextInputType.text,
                  padding: EdgeInsets.all(20.0),
                  textAlign: TextAlign.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: const [
                      BoxShadow(blurRadius: 20.0, color: Colors.black26),
                    ],
                  ),
                  onEditingComplete: () {
                    // TODO 打开新窗口
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
