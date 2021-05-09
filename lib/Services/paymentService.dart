import 'dart:convert';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:wave_mobile_app/models/StripeTransactionResponse.dart';
import 'package:http/http.dart' as http;

class StripeService {
  static String apiBase = "https://api.stripe.com/v1";
  static String paymentApiUrl = "${StripeService.apiBase}/payment_intents";
  static String secret =
      "sk_test_51IoqQlSCkiL3pN0ucPTa2XyGPFLQ2EiFMeAjKzt3TyM1EIn8ESyNz7gKhp5EW66SgKDsOIXONZ5R08p8w1SQyBTL00HHXKM2fu";
  static Map<String, String> headers = {
    "Authorization": "Bearer ${StripeService.secret}",
    "Content-Type": "application/x-www-form-urlencoded",
  };

  static init() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey:
            "pk_test_51IoqQlSCkiL3pN0uPH1farK8etpfPUHTts9ZlkuJyHHjYu3uSPOrFvopoLkayFnc9oIkyO6sMBDNiawXtPboET4500VB9GD6Jz",
        merchantId: "Test",
        androidPayMode: "test",
      ),
    );
  }

  static Future<StripeTransactionResponse> payViaExistingCard(
      {String amount, String currency, CreditCard card}) async {
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card));

      var paymentIntent =
          await StripeService.createPayentIntent(amount, currency);

      var response = await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: paymentIntent["client_secret"],
          paymentMethodId: paymentMethod.id,
        ),
      );

      if (response.status == "succeeded") {
        return StripeTransactionResponse(
          message: "Transaction success!",
          isSuccess: true,
        );
      } else {
        return StripeTransactionResponse(
          message: "Transaction failed...",
          isSuccess: false,
        );
      }
    } catch (error) {
      return StripeTransactionResponse(
        message: "Something went wrong...",
        isSuccess: false,
      );
    }
  }

  static Future<Map<String, dynamic>> createPayentIntent(
      String amount, String currency) async {
    Map<String, dynamic> body = {
      "amount": amount,
      "currency": currency,
      "payment_method_types[]": "card",
      "description": "Software development services",
    };
    try {
      var response = await http.post(
        StripeService.paymentApiUrl,
        body: body,
        headers: StripeService.headers,
      );
      return jsonDecode(response.body);
    } catch (error) {
      print("error : ${error.toString()}");
    }
    return null;
  }
}
