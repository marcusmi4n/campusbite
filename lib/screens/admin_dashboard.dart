import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Center(child: Text("Sales Report")),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Center(child: Text("Order Count")),
          ),
          // Add more admin sections as per Figma design
        ],
      ),
    );
  }
}
