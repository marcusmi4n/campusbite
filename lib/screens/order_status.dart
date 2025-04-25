import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Status")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order #12345", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Status: In Transit", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            LinearProgressIndicator(value: 0.6), // Progress bar for order delivery
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add action to contact support
              },
              child: Text("Contact Support"),
            ),
          ],
        ),
      ),
    );
  }
}
