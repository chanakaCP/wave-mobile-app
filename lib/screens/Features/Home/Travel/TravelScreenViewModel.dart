import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/screens/Features/Home/Travel/map/mapView.dart';

class TravelScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  final formKey = GlobalKey<FormState>();
  final fromController = TextEditingController();
  final toController = TextEditingController();

  void initialise() {
    fromController.text = "";
    toController.text = "";
  }

  onClickProceed() async {
    Get.to(MapViewScreen());
    notifyListeners();
  }
}
