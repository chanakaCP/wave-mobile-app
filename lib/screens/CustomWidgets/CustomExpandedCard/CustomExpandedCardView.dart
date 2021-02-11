import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomContactRow.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomExpandedCard/CustomExpandedCardViewModel.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';

// ignore: must_be_immutable
class CustomExpandedCard extends StatelessWidget {
  String title, tailingText, imageURL, email, contactNumber;

  CustomExpandedCard(
      {@required this.title,
      this.tailingText,
      this.imageURL,
      this.email,
      this.contactNumber});

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
              // height: blockHeight * 12.5,
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
                  Row(
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
                      CustomText(
                        text: tailingText,
                        color: Colors.blue[700],
                      ),
                    ],
                  ),
                  (model.isExpand == true)
                      ? CustomContactRow(
                          email: "email", contactNumber: "0779232611")
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
