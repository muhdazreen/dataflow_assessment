import 'package:dataflow_assessment/component/credit_balance.dart';
import 'package:dataflow_assessment/navigationator.dart';
import 'package:dataflow_assessment/pages/credit_topup_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _notimplement (BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Notice"),
          content: const Text("This feature is not implemented yet."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/shopplant.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "johndoe@someone.com",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () => _notimplement(context),
                    child: const Text("Edit Profile", style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  CreditBalance(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Settings List
            _buildSectionTitle("Account"),
            _buttonTile(context, Icons.history, "Booking History"),
            _buttonTile(context, Icons.favorite, "Favorites"),
            _buttonTile(context, Icons.payment, "Reload, Credit, and Payment Methods", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreditTopUpPage(),
                ),
              );
            }),


            const SizedBox(height: 20),

            _buildSectionTitle("Settings"),
            _buttonTile(context, Icons.notifications, "Notifications", onTap: () {
              Navigationator.of(context).setPage(3);
            },),
            _buttonTile(context, Icons.lock, "Privacy"),
            _buttonTile(context, Icons.help, "Help & Support"),

            const SizedBox(height: 20),

            // Logout
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
                onTap: () =>_notimplement(context)
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buttonTile(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green[700]),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap ?? () => _notimplement(context),
      ),
    );
  }
}
