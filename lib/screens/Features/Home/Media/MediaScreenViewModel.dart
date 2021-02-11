import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/Topic.dart';
import 'package:wave_mobile_app/screens/Features/Home/Media/FM/FMListScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Media/TV/TVListScreenView.dart';

class MediaScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  List<Topic> topics = [
    Topic(
      title: "TV Channels",
      imageURL: "assets/icons/media/tv.png",
      idetifier: "tv",
      callback: TVListScreen(),
    ),
    Topic(
      title: "Radio Channels",
      imageURL: "assets/icons/media/radio.png",
      idetifier: "radio",
      callback: FMListScreen(),
    )
  ];
}
