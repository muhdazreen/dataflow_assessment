import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF244b3a),
      // color: Colors.green[900],
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          Text(
            "LOGO",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "NEXT APPOINTMENT",
            style: TextStyle(color: Colors.white70, letterSpacing: 2),
          ),
          SizedBox(height: 12),

          // Appointment details row
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: [
              _buildInfoRow(Icons.calendar_today, "14 Oct 2020"),
              _buildInfoRow(Icons.access_time, "12:30 PM"),
              _buildInfoRow(Icons.location_on, "123 Plant Street"),
            ],
          ),

          SizedBox(height: 16),

          // CREDIT / POINTS / PACKAGE
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBoxInfo("CREDIT", "RM100.00"),
                _buildBoxInfo("POINTS", "10"),
                _buildBoxInfo("PACKAGE", "1"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 16),
        SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.white)),
      ],
    );
  } 
  
  Widget _buildBoxInfo(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        Text(
          value,
          style: TextStyle(
              color: Colors.green[800], fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}