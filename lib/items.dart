import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class Items extends StatelessWidget {
  Items({Key key, this.keyword}) : super(key: key);

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return ItemsPage(
      keyword: keyword,
    );
  }
}

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key, this.keyword}) : super(key: key);

  final String keyword;

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List _list = List();

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    setState(() {
      _list = _getList(widget.keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.all(0.0),
          child: Icon(Icons.keyboard_arrow_down),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        middle: const Text("搜索列表"),
      ),
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_list[index]['name']),
              onTap: () {},
            );
          }),
    );
  }

  _getList(String keyword) async {
    try {
      Response response;
      response = await Dio().get("https://api.wispx.cn/music/search", queryParameters: {'keywords': keyword});
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
