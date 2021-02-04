import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/Features/Home/Health/HealthScreenViewModel.dart';

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HealthScreenViewModel>.reactive(
      viewModelBuilder: () => HealthScreenViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                RaisedButton(
                  onPressed: () async {
                    await model.authService.signOut();
                  },
                  child: Text("LOGOUT"),
                )
              ],
            ),
            body: Container(
              child: Text("health screen"),
            ),
          ),
        );
      },
    );
  }
}
