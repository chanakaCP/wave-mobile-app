import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/models/Payment.dart';

import 'CustomText.dart';

// ignore: must_be_immutable
class CustomPaymentHistoryCard extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  Payment payment;
  CustomPaymentHistoryCard(this.payment);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: blockWidth * 3,
            right: blockWidth * 3,
            top: blockWidth * 3,
          ),
          padding: EdgeInsets.symmetric(
            vertical: blockHeight * 2,
            horizontal: blockWidth * 3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: payment.type,
                    color: Colors.blue[800],
                    size: blockHeight * 2.5,
                  ),
                  CustomText(
                    text: "Bill No : " + payment.billNo,
                    color: Colors.blue[700],
                    size: blockHeight * 2,
                  ),
                  Text(
                    payment.date.toDate().toString(),
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  )
                ],
              ),
              RichText(
                text: TextSpan(
                    text: "LKR ",
                    style: TextStyle(
                      fontSize: blockHeight * 2.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: payment.amount,
                      ),
                    ]),
              )
              // Text("Shan")
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: blockWidth * 5),
          child: Divider(
            height: blockHeight,
            color: Colors.blue[600],
          ),
        )
      ],
    );
  }
}
