import 'package:dataflow_assessment/global.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Image.asset(
            'assets/homebanner.jpg',
            fit: BoxFit.scaleDown,
            width: double.maxFinite,
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMenuButton("SHOP", onTap: () {
                  final ctx = shopPlantsKey.currentContext; 
                  if (ctx != null) {
                    Scrollable.ensureVisible(
                      shopPlantsKey.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      alignment: 0.5, 
                    );
                  }
                },),
                _buildMenuButton("SERVICES", onTap: () {
                  final ctx = newServicesKey.currentContext;
                  if (ctx != null) {
                    Scrollable.ensureVisible(
                      newServicesKey.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      alignment: 0.5, 
                    );
                  }
                }),
                _buildMenuButton("POSTS"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton(imagePath: "assets/res/Button - Icon 1.png"),
                _buildImageButton(imagePath: "assets/res/Button - Icon 2.png"),
                _buildImageButton(imagePath: "assets/res/Button - Icon 3.png"),
                _buildImageButton(imagePath: "assets/res/Button - Icon 4.png"),
                _buildImageButton(imagePath: "assets/res/Button - Icon 5.png"),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _buildMenuButton(String label, {VoidCallback? onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF244b3a),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 3,
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }

  Widget _buildImageButton({IconData? icon, String? imagePath}) {
    return Container(
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
                fit: BoxFit.cover,
              )
            : Icon(
                icon,
                size: 30,
                color: Colors.black87,
              ),
      ),
    );
  }
}
