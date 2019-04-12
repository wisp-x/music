import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'util.dart';
import 'player.dart';

class Items extends StatelessWidget {
  Items({Key key, this.type, this.keyword}) : super(key: key);

  final String type;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ItemsPage(
        type: type,
        keyword: keyword,
      ),
    );
  }
}

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key, this.type, this.keyword}) : super(key: key);

  final String type;
  final String keyword;

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List _list = List();

  // 页码
  int _page = 1;

  // 每页显示数量
  int _limit = 30;

  // 是否正在请求
  bool _request = false;

  // 是否为最后一页
  bool _isLastPage = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _getList(widget.type, widget.keyword);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getList(widget.type, widget.keyword);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        /* leading: CupertinoButton(
          padding: EdgeInsets.all(0.0),
          child: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ), */
        middle: const Text("搜索列表"),
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(height: .0),
        controller: _scrollController,
        itemCount: _list == null ? 1 : _list.length + 1,
        itemBuilder: _render,
      ),
    );
  }

  Widget _getMoreWidget() {
    if (_isLastPage) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(
          "没有更多了",
          style: TextStyle(color: Colors.grey),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(
          radius: 10.0,
        ),
      );
    }
  }

  // 渲染列表数据
  Widget _render(BuildContext context, int index) {
    if (index < _list.length) {
      return ListTile(
        title: Text(
          "${_list[index]['name']}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text('${_list[index]['artist'][0]}'),
        onTap: () async {
          await Util.openPage(context, Player());
        },
      );
    }

    return _getMoreWidget();
  }

  Future<Null> _getList(String type, String keyword) async {
    if (!this.mounted) return;
    if (false == _request && false == _isLastPage || _list.length == 0) {
      setState(() {
        _request = true;
        _isLastPage = false;
      });
    }
    try {
      await Dio().post(
        "https://api.wispx.cn/music/search",
        data: {
          'type': type,
          'keywords': keyword,
          'page': _page,
          'limit': _limit,
        },
      ).then((response) {
        if (response.statusCode == 200) {
          var data = json.decode(response.data);
          if (data.length > 0) {
            setState(() {
              if (_page == 1 && data.length < _limit) {
                _isLastPage = true;
              }
              _list.addAll(data);
              _page++;
            });
          } else {
            setState(() {
              _isLastPage = true;
            });
          }
        }
      });
    } catch (e) {}
  }
}
