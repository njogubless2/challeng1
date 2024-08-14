import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {
  final String methodName;
  final String methodDetails;
  final VoidCallback onChange;

  const PaymentMethodWidget({super.key, 
    required this.methodName,
    required this.methodDetails,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.payment),
        title: Text(methodName),
        subtitle: Text(methodDetails),
        trailing: ElevatedButton(
          onPressed: onChange,
          child: const Text('Change'),
        ),
      ),
    );
  }
}
