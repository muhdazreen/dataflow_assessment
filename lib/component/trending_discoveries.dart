import 'package:dataflow_assessment/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TrendingDiscoveries extends StatelessWidget {
  const TrendingDiscoveries({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> loremTexts = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Donec ut felis sit amet nulla commodo tincidunt.",
      "Lorem ipsum dolor sit amet.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec ex sed sapien fermentum aliquet sit amet vitae justo.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam erat volutpat.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus vitae neque posuere posuere sit amet a justo.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae orci at odio blandit porta.",
    ];

    final List<Map<String, String>> items = List.generate(
      loremTexts.length,
      (index) {
        return {
          "title": "Lorem Ipsum",
          "subtitle": loremTexts[index], 
          "price": "10.00",
          "image": "assets/homebanner.jpg",
        };
      },
    );

    return Container(
      color: const Color(0xFF234D3C),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        children: [
          Image.asset(
            "assets/trendingdisco.jpg",
            width: double.infinity,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductPage(
                            title: item["title"] ?? "Untitled",
                            description: item["subtitle"] ?? "",
                            image: item["image"] ?? "assets/homebanner.jpg",
                            price: double.tryParse(item["price"] ?? "0") ?? 0,
                            discount: double.tryParse(item["discount"] ?? "0") ?? 0,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 4,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min, // fit content
                        children: [
                          Image.asset(
                            item["image"] ?? "assets/homebanner.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item["title"] ?? "Lorem Ipsum",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Text(
                              item["subtitle"] ?? "",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "RM${item["price"]}",
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
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
