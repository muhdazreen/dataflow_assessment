import 'package:dataflow_assessment/component/credit_balance.dart';
import 'package:dataflow_assessment/component/next_appointment.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF244b3a),
      // color: Colors.green[900],
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
          Text(
            "LOGO",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: Colors.white54, 
                  thickness: 1,
                  endIndent: 10,
                ),
              ),
              Text(
                'NEXT APPOINTMENT',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const Expanded(
                child: Divider(
                  color: Colors.white54,
                  thickness: 1,
                  indent: 10,
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          NextAppointment(),    
          SizedBox(height: 10),
          CreditBalance(),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}