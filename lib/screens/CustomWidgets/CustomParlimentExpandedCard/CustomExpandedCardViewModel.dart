import 'package:flutter/material.dart';

class CustomParlimentExpandedCardViewModel extends ChangeNotifier {
  bool isExpand;

  inititalize() {
    isExpand = false;
  }

  onClickExpand() {
    this.isExpand = !this.isExpand;
    notifyListeners();
  }
}
