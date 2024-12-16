import 'package:flutter/cupertino.dart';

extension LazyLoadListener on ScrollController {
  void lazyLoadListener({required VoidCallback onRequest}) {
    addListener(() {
      if (position.pixels == position.maxScrollExtent) onRequest();
    });
  }
}

extension LazyLoadEndNotification on ScrollEndNotification {
  bool lazyLoadEndNotification({required VoidCallback onRequest}) {
    if (metrics.pixels == metrics.maxScrollExtent) onRequest();

    return true;
  }
}