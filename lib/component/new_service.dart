import 'package:dataflow_assessment/pages/product_page.dart';
import 'package:flutter/material.dart';

class NewServicesProduct extends StatefulWidget {
  const NewServicesProduct({super.key});

  @override
  State<NewServicesProduct> createState() => _NewServicesProductState();
}

class _NewServicesProductState extends State<NewServicesProduct> {
  final ScrollController _controller = ScrollController();

  double _scrollPosition = 0.0;
  double _scrollWidth = 0.0;

   @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _scrollPosition = _controller.offset;
        _scrollWidth = _controller.position.maxScrollExtent;
      });
    });
  }

  // Example data (later you can fetch from API)
  final List<Map<String, String>> items = List.generate(10, (index) {
    return {
      "title": "Lorem Ipsum",
      "subtitle": "Lorem ipsum dolor sit amet consectetur",
      "price": '10.00',
      "image": "assets/homebanner.jpg",
    };
  });

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "NEW SERVICES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Example: navigate or show more
                  debugPrint("View All tapped");
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Recommended based on your preference",
            style: TextStyle(
              fontSize: 10,
              color: Color.fromARGB(255, 101, 101, 101),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),

          // Horizontal scrollable cards
          SizedBox(
            height: 240,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 3),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            title: item["title"]!,
                            description: item["subtitle"]!, 
                            image: item["image"]!,
                            price: double.parse(item["price"]!.replaceAll("RM ", "")),
                            // price: 100,
                            discount: item["discount"] != null ? double.parse(item["discount"]!) : 0,
                          ),

                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // image
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              item["image"]!,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // texts
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item["title"]!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item["subtitle"]!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item["price"]!,
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: SizedBox(
              height: 12, // enough height to fit thumb
              width: totalWidth,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Grey track (1px)
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.green.shade800,
                  ),

                  Align(
                    alignment: Alignment(
                      (_scrollWidth == 0)
                          ? -1
                          : (_scrollPosition / _scrollWidth) * 2 - 1,
                      0,
                    ),
                    child: Container(
                      height: 4,
                      width: totalWidth * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
