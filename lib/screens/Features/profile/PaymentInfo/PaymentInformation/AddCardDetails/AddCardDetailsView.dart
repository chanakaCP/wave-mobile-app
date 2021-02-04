import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';

import 'AddCardDetailsViewModel.dart';

// ignore: must_be_immutable
class AddCardDetailsView extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCardDetailsViewModel>.reactive(
      viewModelBuilder: () => AddCardDetailsViewModel(),
      builder: (_, model, child) {
        return Scaffold(
          body: SafeArea(
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(
                vertical: blockHeight * 7.5,
                horizontal: blockWidth * 2,
              ),
              duration: Duration(milliseconds: 300),
              child: Stack(children: [
                CreditCardInputForm(
                  showResetButton: true,
                  onStateChange: (currentState, cardInfo) {
                    if (currentState == InputState.DONE) {
                      model.card.cardNumber = cardInfo.cardNumber;
                      model.card.name = cardInfo.name;
                      model.card.validate = cardInfo.validate;
                      model.card.cvv = cardInfo.cvv;

                      model.onClickDone();
                    }
                  },
                  // customCaptions: customCaptions,
                  // cardCVV: '222',
                  // cardName: 'Jeongtae Kim',
                  // cardNumber: '1111111111111111',
                  // cardValid: '12/12',
                  // intialCardState: InputState.DONE,
                  // frontCardDecoration: cardDecoration,
                  // backCardDecoration: cardDecoration,
                  // prevButtonStyle: buttonStyle,
                  // nextButtonStyle: buttonStyle,
                  // prevButtonTextStyle: buttonTextStyle,
                  // nextButtonTextStyle: buttonTextStyle,
                  // resetButtonTextStyle: buttonTextStyle,
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
