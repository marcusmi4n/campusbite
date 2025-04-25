import 'package:flutter/material.dart';

class OffersDealsScreen extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {"title": "Discount on Pizza", "expiry": "Expires in 2 days"},
    {"title": "Free Delivery on Orders", "expiry": "Expires in 1 day"},
    // Add more offers as per Figma design
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Offers & Deals")),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(offers[index]['title']!),
              subtitle: Text(offers[index]['expiry']!),
            ),
          );
        },
      ),
    );
  }
}
