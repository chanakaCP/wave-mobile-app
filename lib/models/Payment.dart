import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Payment {
  final String id;
  final String amount;
  final String billNo;
  final String type;
  final Timestamp date;

  Payment({
    @required this.id,
    @required this.amount,
    @required this.billNo,
    @required this.type,
    @required this.date,
  });
}
