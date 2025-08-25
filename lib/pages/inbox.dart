import 'package:flutter/material.dart';

class NotificationInboxPage extends StatefulWidget {
  const NotificationInboxPage({super.key});

  @override
  State<NotificationInboxPage> createState() => _NotificationInboxPageState();
}

class _NotificationInboxPageState extends State<NotificationInboxPage> {
  // Example notification data
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Booking Confirmed",
      "message": "Your appointment at Green Salon is confirmed for 10:30 AM.",
      "time": "2h ago",
      "isRead": false,
    },
    {
      "title": "Discount Available",
      "message": "Get 20% off on your next booking this week!",
      "time": "Yesterday",
      "isRead": true,
    },
    {
      "title": "Reminder",
      "message": "Don’t forget your upcoming appointment tomorrow at 3:00 PM.",
      "time": "2 days ago",
      "isRead": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Container(
            decoration: BoxDecoration(
              color: notif["isRead"] ? Colors.white : const Color(0xFFE8F5E9), // light green for unread
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
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.green[700],
                child: const Icon(Icons.notifications, color: Colors.white),
              ),
              title: Text(
                notif["title"],
                style: TextStyle(
                  fontWeight: notif["isRead"] ? FontWeight.w500 : FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    notif["message"],
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    notif["time"],
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              trailing: notif["isRead"]
                  ? null
                  : Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
              onTap: () {
                setState(() {
                  notifications[index]["isRead"] = true;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
