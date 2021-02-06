import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class CustomPageView extends StatelessWidget {
  final VoidCallback callbackHead;
  final VoidCallback callbackTail;
  final Widget childWidget;
  final String title;

  CustomPageView({
    @required this.callbackHead,
    @required this.callbackTail,
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
            padding: EdgeInsets.symmetric(horizontal: blockHeight * 2),
            height: blockHeight * 12.5,
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (callbackHead != null)
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          callbackHead();
                        },
                      )
                    : IconButton(
                        icon: Icon(null),
                        color: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                      ),
                CustomText(
                  text: title,
                  size: blockHeight * 4,
                  weight: FontWeight.w400,
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.white,
                  onPressed: () async {
                    callbackTail();
                  },
                )
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
