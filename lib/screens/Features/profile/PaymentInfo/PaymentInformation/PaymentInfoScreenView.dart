import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/Features/profile/PaymentInfo/PaymentInformation/AddCardDetails/AddCardDetailsView.dart';
import 'MyCardDetails/MyCardDetailesView.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PaymentInfoScreenView extends StatefulWidget {
  @override
  _PaymentTabViewScreenState createState() => _PaymentTabViewScreenState();
}

class _PaymentTabViewScreenState extends State<PaymentInfoScreenView>
    with SingleTickerProviderStateMixin {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 2.5,
          child: new Icon(Icons.add),
          backgroundColor: Colors.blue[800],
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              isDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              elevation: 10.0,
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: (context) => AddCardDetails(),
            );
          },
        ),
        body: Container(
          child: CustomPageView(
            callbackHead: () {
              Get.back();
            },
            callbackTail: () async {
              await authService.signOut();
            },
            title: "My cards",
            childWidget: SingleChildScrollView(
              child: Container(
                height: blockHeight * 88,
                child: MyCardDetailsView(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
