import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/screens/Features/Home/Travel/TravelScreenViewModel.dart';

class TravelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TravelScreenViewModel>.reactive(
      viewModelBuilder: () => TravelScreenViewModel(),
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
              child: Text("Travel screen"),
            ),
          ),
        );
      },
    );
  }
}
