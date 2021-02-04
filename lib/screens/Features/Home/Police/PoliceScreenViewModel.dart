import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/Topic.dart';

class PoliceScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  List<dynamic> topics = [
    Topic(
      title: "Police Stations",
      imageURL: "assets/icons/police/station.png",
      idetifier: "police",
    ),
    Topic(
      title: "Pay Fine",
      imageURL: "assets/icons/police/fine.png",
      idetifier: "fine",
    )
  ];
}
