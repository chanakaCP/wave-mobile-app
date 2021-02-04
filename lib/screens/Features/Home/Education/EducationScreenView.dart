import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/Features/Home/Education/EducationScreenViewModel.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EducationScreenViewModel>.reactive(
      viewModelBuilder: () => EducationScreenViewModel(),
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
              child: Text("Education screen"),
            ),
          ),
        );
      },
    );
  }
}
