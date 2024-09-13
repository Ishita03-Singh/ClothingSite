import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? clientSecret;

  @override
  void initState() {
    super.initState();
    createPaymentIntent();
  }

  Future<void> createPaymentIntent() async {
    try {
      // Make API request to your backend to create a payment intent
      final response = await http.post(
        Uri.parse('https://your-backend-url.com/create-payment-intent'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'amount': '2000'}), // Amount in cents (e.g., $20.00)
      );

      final jsonResponse = json.decode(response.body);
      setState(() {
        clientSecret = jsonResponse['clientSecret'];
      });
    } catch (e) {
      print('Error creating payment intent: $e');
    }
  }

  Future<void> pay() async {
    if (clientSecret == null) return;

    try {
      // final paymentMethodParams = PaymentMethodParams.card(
      //   paymentMethodData: PaymentMethodData()
      // );

      // Confirm payment
      await Stripe.instance.confirmPayment(    
        paymentIntentClientSecret:clientSecret!,
        
      );

      print('Payment successful');
    } catch (e) {
      print('Payment failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: pay,
          child: Text('Pay \$20'),
        ),
      ),
    );
  }
}
