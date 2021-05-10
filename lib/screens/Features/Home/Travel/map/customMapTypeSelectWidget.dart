import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomMapTypeSelect {
  customMapTypeSelectWidget({String title, String img, VoidCallback callback}) {
    return SpeedDialChild(
      child: CircleAvatar(
        backgroundImage: AssetImage(img),
        backgroundColor: Colors.blueGrey[100],
        radius: 60.0,
      ),
      backgroundColor: Colors.blueAccent[200],
      foregroundColor: Colors.white,
      label: title,
      labelStyle: TextStyle(fontSize: 18.0),
      onTap: () => callback(),
    );
  }
}
