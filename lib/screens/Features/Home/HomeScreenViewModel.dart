import 'package:flutter/material.dart';
import 'package:wave_mobile_app/models/Topic.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/BillScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Education/EducationScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Health/HealthScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Law/LawScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Media/MediaScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Parliment/ParlimentScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Police/PoliceScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Home/Travel/TravelScreenView.dart';

class HomeScreenViewModel extends ChangeNotifier {
  List<Topic> topics = [
    Topic(
      title: "Bills",
      imageURL: "assets/icons/bill.png",
      idetifier: "bill",
      callback: BillScreen(),
    ),
    Topic(
      title: "Communications and Media",
      imageURL: "assets/icons/media.png",
      idetifier: "media",
      callback: MediaScreen(),
    ),
    Topic(
      title: "Health",
      imageURL: "assets/icons/health.png",
      idetifier: "health",
      callback: HealthScreen(),
    ),
    Topic(
      title: "Police",
      imageURL: "assets/icons/police.png",
      idetifier: "bill",
      callback: PoliceScreen(),
    ),
    Topic(
      title: "Law and Justies",
      imageURL: "assets/icons/law.png",
      idetifier: "law",
      callback: LawScreen(),
    ),
    Topic(
      title: "Education",
      imageURL: "assets/icons/education.png",
      idetifier: "education",
      callback: EducationScreen(),
    ),
    Topic(
      title: "Travel",
      imageURL: "assets/icons/travel.png",
      idetifier: "travel",
      callback: TravelScreen(),
    ),
    Topic(
      title: "Parliment",
      imageURL: "assets/icons/parliment.png",
      idetifier: "parliment",
      callback: ParlimentScreen(),
    )
  ];
}
