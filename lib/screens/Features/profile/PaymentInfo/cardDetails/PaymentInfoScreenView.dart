import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Services/AuthService.dart';
import '../../../../../Shared/SizeConfig.dart';
import '../../../../CustomWidgets/CustomPageView.dart';
import 'AddCardDetails/AddCardDetailsView.dart';
import 'MyCardDetails/MyCardDetailesView.dart';

class PaymentInfoScreenView extends StatefulWidget {
  PaymentInfoScreenView({@required this.isPay, this.amount});
  final bool isPay;
  String amount;

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
        floatingActionButton: FloatingActionButton.extended(
          elevation: 2.5,
          icon: Icon(Icons.add),
          label: Text("Add Card"),
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
            title: "My cards",
            childWidget: SingleChildScrollView(
              child: Container(
                height: blockHeight * 88,
                child: MyCardDetailsView(
                  isPay: this.widget.isPay,
                  amount: this.widget.amount,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
