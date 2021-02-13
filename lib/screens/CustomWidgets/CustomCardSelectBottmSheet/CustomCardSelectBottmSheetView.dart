import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomCardSelectBottmSheet/CustomCardSelectBottmSheetViewModel.dart';

// ignore: must_be_immutable
class CustomCardSelectBottmSheet extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomCardSelectBottmSheetViewModel>.reactive(
      viewModelBuilder: () => CustomCardSelectBottmSheetViewModel(),
      builder: (_, model, child) {
        return Container(
          color: Colors.black12,
          height: blockHeight * 60,
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(
              vertical: blockHeight * 7.5,
              horizontal: blockWidth * 2,
            ),
            duration: Duration(milliseconds: 300),
            child: Stack(children: [
              CreditCardInputForm(
                showResetButton: true,
                nextButtonDecoration: model.buttonStyle,
                prevButtonDecoration: model.buttonStyle,
                resetButtonDecoration: model.buttonStyle,
                onStateChange: (currentState, cardInfo) {
                  if (currentState == InputState.DONE) {
                    model.card.cardNumber = cardInfo.cardNumber;
                    model.card.name = cardInfo.name;
                    model.card.validate = cardInfo.validate;
                    model.card.cvv = cardInfo.cvv;

                    model.onClickDone();
                  }
                },
              ),
            ]),
          ),
        );
      },
    );
  }
}
