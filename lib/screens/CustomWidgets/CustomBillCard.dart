import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomIconButton.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class CustomBillCard extends StatelessWidget {
  String title, imageURL;
  final VoidCallback callback;

  CustomBillCard(
      {@required this.title, @required this.imageURL, @required this.callback});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: blockHeight * 12.5,
        margin: EdgeInsets.only(
          left: blockWidth * 7.5,
          right: blockWidth * 7.5,
          top: blockWidth * 5,
        ),
        padding: EdgeInsets.symmetric(
          vertical: blockHeight * 2,
          horizontal: blockWidth * 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageURL,
                width: blockWidth * 15,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: blockWidth * 2),
            VerticalDivider(
              endIndent: 7.5,
              indent: 7.5,
              thickness: 1,
              color: Colors.blue[400],
            ),
            SizedBox(width: blockWidth * 5),
            Expanded(
              child: CustomText(
                text: title,
                color: Colors.blue[700],
              ),
            ),
            CustomIconButton(
              icon: Icons.arrow_forward_ios_outlined,
              callback: () {
                callback();
              },
            )
          ],
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
