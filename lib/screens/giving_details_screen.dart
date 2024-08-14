import 'package:app1/widgets/payment.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';


class GivingDetailsScreen extends StatelessWidget {
  const GivingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giving details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Make sure everything is correct'),
            const SizedBox(height: 16.0),
            const CustomCard(
              title: 'Harvesters Int\'l Yaba Campus',
              subtitle: 'Tithe',
              amount: '₦1,018,893.00',
              frequency: 'Weekly',
              startDate: 'Monday 10th Nov, 2022',
              fee: '₦125.00',
              status: 'Paused',
              nextDue: 'Monday 10th Nov, 2022',
              buttonText: 'Update giving',
            ),
            const SizedBox(height: 16.0),
            PaymentMethodWidget(
              methodName: 'Paystack',
              methodDetails: 'Visa 79378****',
              onChange: () {
                // Handle payment method change
              },
            ),
          ],
        ),
      ),
    );
  }
}
