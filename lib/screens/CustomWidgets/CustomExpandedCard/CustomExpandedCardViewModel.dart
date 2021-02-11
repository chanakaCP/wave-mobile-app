import 'package:flutter/material.dart';

class CustomExpandedCardViewModel extends ChangeNotifier {
  bool isExpand;

  inititalize() {
    isExpand = false;
  }

  onClickExpand() {
    this.isExpand = !this.isExpand;
    notifyListeners();
  }
}
