import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomContactRow.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomExpandedCard/CustomExpandedCardViewModel.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class CustomExpandedCard extends StatelessWidget {
  String title,
      subTitle,
      tailingText,
      imageURL,
      email,
      contactNumber,
      facebook,
      web;

  CustomExpandedCard(
      {@required this.title,
      this.subTitle,
      this.tailingText,
      this.imageURL,
      this.email,
      this.contactNumber,
      this.facebook,
      this.web});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomExpandedCardViewModel>.reactive(
      viewModelBuilder: () => CustomExpandedCardViewModel(),
      onModelReady: (model) => {
        model.inititalize(),
      },
      builder: (_, model, child) {
        return InkWell(
          child: Container(
              margin: EdgeInsets.only(
                left: blockWidth * 5,
                right: blockWidth * 5,
                top: blockWidth * 5,
              ),
              padding: EdgeInsets.symmetric(
                vertical: blockHeight * 3,
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
              child: Column(
                children: [
                  (imageURL != null)
                      ? Row(
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
                            // VerticalDivider(
                            //   // endIndent: 7.5,
                            //   // indent: 7.5,
                            //   thickness: 5,
                            //   color: Colors.blue[400],
                            // ),
                            // SizedBox(width: blockWidth * 5),
                            Expanded(
                              child: CustomText(
                                text: title,
                                color: Colors.blue[700],
                              ),
                            ),
                            CustomText(
                              text: tailingText,
                              color: Colors.blue[700],
                            ),
                          ],
                        )
                      : Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: title,
                                color: Colors.blue[700],
                              ),
                              Text(
                                subTitle,
                                style: TextStyle(
                                  color: Colors.blue[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                  (model.isExpand == true)
                      ? SizedBox(height: blockHeight * 2)
                      : Container(),
                  (model.isExpand == true)
                      ? Divider(
                          thickness: 0.5,
                          color: Colors.blue[900],
                        )
                      : Container(),
                  (model.isExpand == true)
                      ? (email == null &&
                              web == null &&
                              contactNumber == null &&
                              facebook == null)
                          ? CustomText(
                              text: "No contct detaile found",
                              color: Colors.red,
                              size: blockWidth * 4,
                            )
                          : CustomContactRow(
                              email: email,
                              contactNumber: contactNumber,
                              facebook: facebook,
                              web: web,
                            )
                      : Container(),
                ],
              )),
          onTap: () {
            model.onClickExpand();
          },
        );
      },
    );
  }
}
