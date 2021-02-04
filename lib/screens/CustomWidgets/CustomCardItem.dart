import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class CustomCardItem extends StatelessWidget {
  String title, imageURL;
  final VoidCallback callback;
  CustomCardItem({
    @required this.title,
    @required this.imageURL,
    @required this.callback,
  });
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: blockHeight * 2,
          horizontal: blockHeight * 2,
        ),
        width: blockWidth * 45,
        height: blockHeight * 25,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: blockHeight * 1.5),
                height: blockHeight * 13,
                width: double.infinity,
                child: Image.asset(imageURL),
              ),
              Divider(
                endIndent: 20.0,
                indent: 20.0,
                color: Colors.blue[900],
                thickness: 1.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 4, vertical: blockHeight * 0.5),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Center(
                        child: CustomText(
                          text: title,
                          color: Colors.blue[900],
                          size: blockHeight * 2,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
