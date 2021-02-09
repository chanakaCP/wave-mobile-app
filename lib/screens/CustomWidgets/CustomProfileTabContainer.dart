import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class CustomProfileTabContainer extends StatelessWidget {
  String title;
  final VoidCallback callback;
  CustomProfileTabContainer({@required this.title, @required this.callback});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 7.5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              color: Colors.blue[800],
              size: blockHeight * 2,
              weight: FontWeight.w400,
            ),
            IconButton(
              padding: EdgeInsets.only(bottom: blockHeight),
              color: Colors.blue[800],
              icon: Icon(
                Icons.keyboard_arrow_right,
                size: blockHeight * 3,
              ),
              onPressed: () {
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
