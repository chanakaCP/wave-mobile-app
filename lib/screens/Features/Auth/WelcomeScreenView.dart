import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/Features/Auth/SignIn/SignInScreenVIew.dart';
import 'package:wave_mobile_app/screens/Features/Auth/SignUp/SignUpScreenView.dart';
import 'package:wave_mobile_app/screens/Features/Auth/WelcomeScreenViewModel.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeScreenViewModel>.reactive(
      viewModelBuilder: () => WelcomeScreenViewModel(),
      onModelReady: (model) {
        model.initialState();
      },
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: blockHeight * 7.5,
                  horizontal: blockWidth * 10,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo/logo.png",
                      width: blockWidth * 90,
                    ),
                    SizedBox(height: blockHeight * 7.5),
                    (model.showSignInScreen == true)
                        ? SignInScreen(
                            changeBodyCallback: () {
                              model.changeBody();
                            },
                          )
                        : SignUpScreen(
                            changeBodyCallback: () {
                              model.changeBody();
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
