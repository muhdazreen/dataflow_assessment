import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:dataflow_assessment/component/credit_balance.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String image;
  final double discount;

  const ProductPage({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    this.discount = 0,
  });

  double get discountedPrice {
    if (discount > 0) {
      return price - (price * discount / 100);
    }
    return price;
  }

  void _buyProduct(BuildContext context) {
    final double finalPrice = discountedPrice;

    if (CreditBalance.credit.value >= finalPrice) {
      CreditBalance.credit.value -= finalPrice;

      Flushbar(
        message: "You bought $title for RM ${finalPrice.toStringAsFixed(2)}",
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(context);

      Future.delayed(const Duration(seconds: 1), () {
        // ignore: use_build_context_synchronously
        if (Navigator.of(context).canPop()) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      });
    } else {
      Flushbar(
        message: "Not enough credit! Please top up.",
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final bool hasDiscount = discount > 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white), // make title white
        ),
        backgroundColor: Colors.green[900],
        iconTheme: const IconThemeData(color: Colors.white), // makes back arrow white
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CreditBalance(),
          SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CreditBalance(),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image,
                      fit: BoxFit.cover, width: double.infinity, height: 250),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(description,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                        const SizedBox(height: 16),

                        // ✅ Price + discount
                        if (hasDiscount) ...[
                          Text(
                            "RM 1000 ${price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "RM ${discountedPrice.toStringAsFixed(2)}  (-$discount%)",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ] else ...[
                          Text(
                            "RM ${price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],

                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _buyProduct(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[700],
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
