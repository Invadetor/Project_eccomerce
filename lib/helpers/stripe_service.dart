import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {

  static final StripeService _stripeService = StripeService._internal();
  StripeService._internal();

  factory StripeService() {
    return _stripeService;
  }

  createPaymentIntent(double amount, String currency) async {
    Map<String, dynamic> body = {
      "amount": amount,
      "currency": currency
    };
    Map<String, String> header = {
      "Authorization": "Bearer " + dotenv.env["StripePrivateKey"]!,
      "ContentType": 'application/x-www-form-urlencoded',
    };

    try{
      Uri uri = Uri.parse("https://api.stripe.com/v1/payment_intents");
      var response = await http.post(uri, headers: header, body: body);

      return json.decode(response.body);
    } catch (errore) {
      print(errore.toString());
    }

  }

  Future<void> initPaymentSheet(String clientSecret) async {
    try {
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: "Negozio",
          customFlow: true,
          googlePay: const PaymentSheetGooglePay(merchantCountryCode: "IT", testEnv: true),
          paymentIntentClientSecret: clientSecret
      ));

    } catch (errore) {
      print(errore.toString());
    }
  }

  displayPaymentSheet() async {
    try{
      await Stripe.instance.presentPaymentSheet()
          .onError((error, stackTrace) {
            throw Exception(error);
      });
    } catch(errore) {
      print(errore.toString());
    }
  }

  Future<void> makePayment(double amount, String currency) async {
    Stripe.publishableKey = "pk_test_51MpCUmFaNCg0prTodJwyM7BAg80hOcmo3U5PzMCIUmhevT0g6atRdjOsDFRQgkgfCFb1cMoNSXlqUxYyMG3UVXup00c5d9q8ap";
    var paymentIntent = await createPaymentIntent(amount, currency);
    await initPaymentSheet(paymentIntent["client_secret"]);
    displayPaymentSheet();
  }

}