import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'cupertino_swipe_back_observer.dart';

class Util {
  static Future openPage(context, Widget builder) async {
    // wait until animation finished
    await CupertinoSwipeBackObserver.promise?.future;

    return await Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) => builder),
    );
  }

  // 复制内容到剪贴板
  static copyToClipboard(final String text) {
    if (text == null) return;
    Clipboard.setData(new ClipboardData(text: text));
  }
}
