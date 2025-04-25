import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    "Your order has been confirmed.",
    "New deal: Chips + Sausage UGX 3,500 only!",
    "You have a 10% discount waiting.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Color(0xFF2C663B),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.notifications, color: Color(0xFF2C663B)),
          title: Text(notifications[index]),
        ),
      ),
    );
  }
}
