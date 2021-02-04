import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';

import 'CustomText.dart';

// ignore: must_be_immutable
class CustomNotificationCard extends StatelessWidget {
  String title;
  IconData cardIcon;
  CustomNotificationCard({@required this.title, this.cardIcon});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: blockHeight * 1.5, horizontal: blockWidth * 5),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 7.5,
          vertical: blockWidth * 4,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          border: Border.all(color: Colors.red, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.red[100],
              blurRadius: 30,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              (cardIcon != null) ? cardIcon : Icons.mood_bad,
              size: blockHeight * 8,
              color: Colors.red,
            ),
            SizedBox(width: blockWidth * 5),
            Expanded(
              child: CustomText(
                text: title,
                color: Colors.red,
                size: blockHeight * 4,
                weight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
