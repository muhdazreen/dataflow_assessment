import 'package:flutter/material.dart';

class CreditBalance extends StatefulWidget {
  const CreditBalance({super.key});

  // A single static notifier accessible anywhere
  static final ValueNotifier<double> credit = ValueNotifier(100.0);
  static final ValueNotifier<int> points = ValueNotifier(10);
  static final ValueNotifier<int> package = ValueNotifier(1);

  @override
  State<CreditBalance> createState() => _CreditBalanceState();
}

class _CreditBalanceState extends State<CreditBalance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBoxInfo("CREDIT", CreditBalance.credit, (v) => "RM${v.toStringAsFixed(2)}"),
          _buildBoxInfo("POINTS", CreditBalance.points, (v) => "$v"),
          _buildBoxInfo("PACKAGE", CreditBalance.package, (v) => "$v"),
        ],
      ),
    );
  }

  Widget _buildBoxInfo<T>(
    String title,
    ValueNotifier<T> notifier,
    String Function(T) format,
  ) {
    return ValueListenableBuilder<T>(
      valueListenable: notifier,
      builder: (context, value, _) {
        return Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 10),
            ),
            Text(
              format(value),
              style: const TextStyle(
                color: Color.fromARGB(255, 53, 53, 53),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
