import 'package:flutter/material.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';

// ignore: must_be_immutable
class CustomPageView extends StatelessWidget {
  final VoidCallback callbackHead;
  final VoidCallback callbackTail;
  final Widget childWidget;

  CustomPageView({
    this.callbackHead, 
    this.callbackTail,
    this.childWidget,
  });

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.lightBlue,
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Container(
                    width: 125.0,
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
                        : Container(),
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
                ),
                SizedBox(height: 50.0),
                Container(
                  height: blockHeight * 87.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150.0),
                    ),
                  ),
                  child: childWidget
                )
              ],
            ),
          ),
        );
  }
}