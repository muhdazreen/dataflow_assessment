import 'package:dataflow_assessment/navigationator.dart';
import 'package:dataflow_assessment/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MallPage extends StatefulWidget {
  const MallPage({super.key});
   @override
  State<MallPage> createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> products = [
    {
      "title": "you can search",
      "subtitle": "Try me",
      "price": 100,
      "discountPrice": null,
      "discount": null,
    },
    {
      "title": "Lorem ipsum dolor sit amet",
      "subtitle": "Lorem Ipsum",
      "price": 100,
      "discountPrice": 50,
      "discount": "50%",
    },
    {
      "title": "Lorem ipsum dolor sit amet consectetur adipiscing elit",
      "subtitle": "Lorem Ipsum",
      "price": 100,
      "discountPrice": null,
      "discount": null,
    },
    {
      "title": "Lorem ipsum dolor sit",
      "subtitle": "Lorem Ipsum",
      "price": 100,
      "discountPrice": 50,
      "discount": "50%",
    },
  ];
  late List<Map<String, dynamic>> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(products);
    _searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    final q = _searchController.text.toLowerCase();
    setState(() {
      filteredProducts = products.where((p) {
        final title = (p["title"] ?? "").toString().toLowerCase();
        final subtitle = (p["subtitle"] ?? "").toString().toLowerCase();
        return title.contains(q) || subtitle.contains(q);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigationator.of(context).goBackToPrevious();
              },
            ),
            Expanded(
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search product",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    // suffixIcon: const Icon(Icons.filter_alt_outlined, color: Colors.black54),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0), // adjust to center image
                      child: Image.asset(
                        "assets/res/Icon - Filter.png",
                        width: 20,
                        height: 20,
                        color: Colors.black54, 
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: 
        filteredProducts.isEmpty
          ? 
        const Center(child: Text("No products found"))
          : 
        MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          // itemCount: products.length,
          itemCount: filteredProducts.length,
          // itemBuilder: (context, index) {
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            // final product = products[index];

            final double price = (product["price"] as num?)?.toDouble() ?? 0.0;
            final String? discountStr = product["discount"];
            final double discountPercent = discountStr != null
                ? double.tryParse(discountStr.replaceAll('%', '')) ?? 0
                : 0;
            final double finalPrice = discountPercent > 0
                ? price - (price * discountPercent / 100)
                : price;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductPage(
                        title: product["title"] ?? "Untitled",
                        description: product["subtitle"] ?? "",
                        image: product["image"] ?? "assets/homebanner.jpg",
                        price: price,
                        discount: discountPercent,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          product["image"] ?? "assets/homebanner.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 120,
                        ),
                        if (discountPercent > 0) // show only if discount exists
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "${discountPercent.toInt()}%", // e.g. 50%
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product["title"] ?? "No Title",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        product["subtitle"] ?? "",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: discountPercent > 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "RM${price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  "RM${finalPrice.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              "RM${price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          }

        ),
      ),
    );
  }
}
