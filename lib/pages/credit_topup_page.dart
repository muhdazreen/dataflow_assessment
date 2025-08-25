import 'package:another_flushbar/flushbar.dart';
import 'package:dataflow_assessment/component/credit_balance.dart';
import 'package:flutter/material.dart';

class CreditTopUpPage extends StatefulWidget {
  const CreditTopUpPage({super.key});

  @override
  State<CreditTopUpPage> createState() => _CreditTopUpPageState();
}

class _CreditTopUpPageState extends State<CreditTopUpPage> {
  final TextEditingController _amountController = TextEditingController();

  void _topUp() {
    final entered = double.tryParse(_amountController.text);
    if (entered != null && entered > 0) {
      CreditBalance.credit.value += entered;

      _amountController.clear();

      Flushbar(
        message: "Successfully topped up RM$entered",
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: Colors.green.shade600,
        flushbarPosition: FlushbarPosition.TOP,
        icon: const Icon(Icons.check_circle, color: Colors.white),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
           "Top Up Wallet",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Balance Card (reactive)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Current Balance",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ValueListenableBuilder<double>(
                      valueListenable: CreditBalance.credit,
                      builder: (context, value, _) {
                        return Text(
                          "RM ${value.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Enter Top-Up Amount",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "e.g. 50.00",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixText: "RM ",
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _topUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Top Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
