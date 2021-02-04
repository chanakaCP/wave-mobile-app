import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Services/databaseService.dart';
import 'package:wave_mobile_app/models/CardDetails.dart';

class AddCardDetailsViewModel extends ChangeNotifier {
  String cardNumber, name, validate, cvv;
  CardDetails card = CardDetails();
  DatabaseService ds = DatabaseService();

  final Map<String, String> customCaptions = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: LinearGradient(
        colors: [
          const Color(0xfffcdf8a),
          const Color(0xfff38381),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final cardDecoration = BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
      ],
      gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.blue,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      borderRadius: BorderRadius.all(Radius.circular(15)));

  final buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  // @override
  // void initState() {
  //   super.initState();
  // }

  onClickDone(){
    ds.addCardDetails(card);
  }

} 