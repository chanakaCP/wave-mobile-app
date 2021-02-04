import 'package:flutter/widgets.dart';

class Topic {
  String title;
  String imageURL;
  String idetifier;
  Widget callback;
  Topic(
      {@required this.title,
      @required this.imageURL,
      @required this.idetifier,
      this.callback});
}
