import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/Topic.dart';

import 'ALevel/ALevelScreenView.dart';
import 'OLevel/OLevelScreenView.dart';

class EducationScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  List<Topic> topics = [
    Topic(
      title: "A/L",
      imageURL: "assets/icons/education/al.png",
      idetifier: "al",
      callback: ALevelScreenView(),
    ),
    Topic(
      title: "O/L",
      imageURL: "assets/icons/education/ol.png",
      idetifier: "ol",
      callback: OLevelScreenView(),
    )
  ];
}
