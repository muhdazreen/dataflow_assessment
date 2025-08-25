import 'package:flutter/material.dart';

class ShopPlantsSlider extends StatefulWidget {
  const ShopPlantsSlider({super.key});

  @override
  State<ShopPlantsSlider> createState() => _ShopPlantsSliderState();
}

class _ShopPlantsSliderState extends State<ShopPlantsSlider> {
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

  final List<String> imageIcon = [
      "assets/res/Shop Plants - Icon 1.png",
      "assets/res/Shop Plants - Icon 2.png",
      "assets/res/Shop Plants - Icon 3.png",
      "assets/res/Shop Plants - Icon 4.png",
      "assets/res/Shop Plants - Icon 5.png",
  ];

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 15, right: 20) ,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Image.asset( 
                    "assets/shopplant.png",
                    height: 100,
                  ),
                ),
              ),

              Expanded(
                flex: 7,
                child: SizedBox(
                  height: 100,
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.transparent, 
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.05, 0.95, 1.0], 
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstIn, 
                    child: ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: imageIcon.length,
                      itemBuilder: (context, index) {
                        return _buildImageButton(imagePath: imageIcon[index]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 30),
          child: SizedBox(
            height: 12, 
            width: totalWidth,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
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
    );
  }

  Widget _buildImageButton({IconData? icon, String? imagePath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                )
              : Icon(
                  icon,
                  size: 30,
                  color: Colors.black87,
                ),
        ),
      ),
    );
  }
}
