import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 此类修复左滑关闭窗口时导致程序奔溃的bug
// See：https://github.com/flutter/flutter/issues/27334#issuecomment-468179107
class CupertinoSwipeBackObserver extends NavigatorObserver {
  static Completer promise;

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    // make a new promise
    promise = Completer();
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    // resolve the promise
    promise.complete();
  }
}
