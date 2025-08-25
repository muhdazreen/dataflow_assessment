import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  final String _mapImage =
      "https://maps.googleapis.com/maps/api/staticmap?center=Petaling+Jaya,Malaysia&zoom=13&size=600x300&maptype=roadmap"
      "&markers=color:red%7Clabel:S%7C3.1161,101.6299&key=AIzaSyA-kw1wFAWqjZCuN0iZ3EO2jDSqQ_0-Ka4";

      // AIzaSyA-kw1wFAWqjZCuN0iZ3EO2jDSqQ_0-Ka4 android

  Future<void> _launchUrl(String urls) async {
    final String url = "https://maps.googleapis.com/maps/api/staticmap?center=Petaling+Jaya,Malaysia&zoom=13&size=600x300&maptype=roadmap"
      "&markers=color:red%7Clabel:S%7C3.1161,101.6299&key=AIzaSyA-kw1wFAWqjZCuN0iZ3EO2jDSqQ_0-Ka4";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "LOCATION",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(_mapImage, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),

          // First location
          _buildLocationItem(
            title: "Sunway Pyramid",
            address:
                "10 Floor, Lorem Ipsum Mall, Jalan ss23 Lorem, Selangor, Malaysia",
            mapUrl: "https://goo.gl/maps/xxxx",
            hours: "10am - 10pm",
          ),

          const SizedBox(height: 16),

          _buildLocationItem(
            title: "The Gardens Mall",
            address:
                "10 Floor, Lorem Ipsum Mall, Jalan ss23 Lorem, Selangor, Malaysia",
            mapUrl: "https://goo.gl/maps/yyyy",
            hours: "10am - 10pm",
          ),
        ],
      ),
    );
  }

  Widget _buildLocationItem({
    required String title,
    required String address,
    required String mapUrl,
    required String hours,
  }) {
    return Padding(padding: EdgeInsetsGeometry.all(10), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Colors.green, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: InkWell(
                  onTap: () => _launchUrl(mapUrl),
                  child: Text(
                    address,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      // color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.green, size: 18),
              const SizedBox(width: 6),
              Text(hours, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ],
      )
    );
  }
}
