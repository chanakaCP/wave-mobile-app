import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_mobile_app/Services/AuthService.dart';
import 'package:wave_mobile_app/models/ServiceProvider.dart';
import 'package:wave_mobile_app/screens/CustomWidgets/CustomBillCard.dart';
import 'package:wave_mobile_app/screens/Features/Home/Bills/TelephoneBill/PhoneBillScreenView.dart';

class PhoneCategoryListScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  List<dynamic> serviceProviders = [
    ServiceProvider(
      name: "Mobitel",
      imageURL: "assets/ServiceProviders/mobitel.png",
      contact: "1717",
      email: "mobitel@gmail.com",
    ),
    ServiceProvider(
      name: "Dialog",
      imageURL: "assets/ServiceProviders/dialog.png",
      contact: "1777",
      email: "dialog@gmail.com",
    ),
    ServiceProvider(
      name: "Hutch",
      imageURL: "assets/ServiceProviders/hutch.png",
      contact: "1212",
      email: "hutch@gmail.com",
    ),
    ServiceProvider(
      name: "Airtel",
      imageURL: "assets/ServiceProviders/airtel.png",
      contact: "123123",
      email: "airtel@gmail.com",
    ),
    ServiceProvider(
      name: "Etisalat",
      imageURL: "assets/ServiceProviders/etisalat.png",
      contact: "8899",
      email: "etisalat@gmail.com",
    ),
    ServiceProvider(
      name: "SLT",
      imageURL: "assets/ServiceProviders/slt.png",
      contact: "456456",
      email: "slt@gmail.com",
    ),
    ServiceProvider(
      name: "Lanka Bell",
      imageURL: "assets/ServiceProviders/bell.png",
      contact: "1515",
      email: "bell@gmail.com",
    ),
  ];

  loadCard() {
    return serviceProviders
        .map((serviceProvider) => CustomBillCard(
              title: serviceProvider.name,
              imageURL: serviceProvider.imageURL,
              callback: () {
                Get.to(PhoneBillScreen(
                  serviceProvider: serviceProvider.name,
                  contact: serviceProvider.contact,
                  email: serviceProvider.email,
                ));
              },
            ))
        .toList();
  }
}
