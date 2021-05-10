import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class CustomPageView extends StatelessWidget {
  final VoidCallback callbackHead;
  final Widget childWidget;
  final String title;

  CustomPageView({
    @required this.callbackHead,
    @required this.childWidget,
    @required this.title,
  });

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(right: blockHeight * 2),
            height: blockHeight * 12.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (callbackHead != null)
                  Positioned(
                    left: blockWidth,
                    top: 2.5 * blockHeight,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        callbackHead();
                      },
                    ),
                  ),
                Positioned(
                  top: 3 * blockHeight,
                  child: CustomText(
                    text: title,
                    size: blockHeight * 4,
                    weight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: blockHeight * 87.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(150.0),
              ),
            ),
            child: childWidget,
          )
        ],
      ),
    );
  }
}
