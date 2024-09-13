import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

void initStripe() {
  Stripe.publishableKey = 'your_stripe_publishable_key';
}

Future<void> createPaymentIntent(String amount) async {
  // Call your backend to create a payment intent
  final response = await http.post(
    Uri.parse('https://your-api-url.com/create-payment-intent'),
    body: json.encode({'amount': amount}),
  );

  if (response.statusCode == 200) {
    final paymentIntent = json.decode(response.body);
    confirmPayment(paymentIntent['clientSecret']);
  }

}
Future<void> confirmPayment(String clientSecret) async {
  try {
    // Create payment method params
    // final paymentMethodParams = PaymentMethodParams.card();

    // Confirm the payment with the client secret and payment method params
    await Stripe.instance.confirmPayment(
      paymentIntentClientSecret:clientSecret, 
      // paymentMethodParams,
    );

    // Handle successful payment confirmation
    print("Payment confirmed successfully!");

  } catch (e) {
    // Handle error
    print("Error confirming payment: $e");
  }
}
