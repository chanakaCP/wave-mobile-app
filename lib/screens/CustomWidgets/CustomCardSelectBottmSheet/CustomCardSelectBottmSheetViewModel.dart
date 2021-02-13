import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/models/CardDetails.dart';

class CustomCardSelectBottmSheetViewModel extends ChangeNotifier {
  CardDetails card = CardDetails();
  DatabaseService ds = DatabaseService();

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.blue[500],
  );

  onClickDone() {
    ds.addCardDetails(card);
    Get.back();
  }
}
