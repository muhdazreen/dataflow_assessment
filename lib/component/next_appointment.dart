import 'package:flutter/material.dart';

class NextAppointment extends StatefulWidget {
  const NextAppointment({super.key});
  @override
  State<NextAppointment> createState() => _NextAppointment();
}

class _NextAppointment extends State<NextAppointment> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 8,
      children: [
        _buildInfoRow(Icons.calendar_today, "14 Oct 2020"),
        _buildInfoRow(Icons.access_time, "12:30 PM"),
        _buildInfoRow(Icons.location_on, "123 Plant Street"),
      ],
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
}