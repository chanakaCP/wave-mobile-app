import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomPageView.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomText.dart';
import 'AddCardDetails/AddCardDetailsView.dart';
import 'MyCardDetails/MyCardDetailesView.dart';

class PaymentTabViewScreen extends StatefulWidget {
  @override
  _PaymentTabViewScreenState createState() => _PaymentTabViewScreenState();
}

class _PaymentTabViewScreenState extends State<PaymentTabViewScreen>
    with SingleTickerProviderStateMixin {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  TabController _tabController;
  final AuthService authService = AuthService();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageView(
      callbackHead: () {
        Get.back();
      },
      callbackTail: () async {
        await authService.signOut();
      },
      childWidget: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: blockHeight * 0.5),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: blockHeight * 6,
                width: double.infinity,
                child: TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  indicatorWeight: blockWidth * 0.5,
                  controller: _tabController,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: blockHeight * 8.75),
                  tabs: [
                    Tab(
                      child: CustomText(
                        text: "Card List",
                        size: blockWidth * 4,
                        weight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: "Add Card",
                        size: blockWidth * 4,
                        weight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: blockHeight * 88,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    MyCardDetailsView(),
                    AddCardDetailsView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
