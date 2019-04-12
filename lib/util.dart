import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cupertino_swipe_back_observer.dart';

class Util {
  static Future openPage(context, Widget builder) async {
    // wait until animation finished
    await CupertinoSwipeBackObserver.promise?.future;

    return await Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) => builder),
    );
  }
}
