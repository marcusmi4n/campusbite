import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {"name": "Pizza", "image": "assets/pizza.jpg", "price": "UGX 12,000"},
    {"name": "Burger", "image": "assets/burger.jpg", "price": "UGX 5,000"},
    // Add more items as per your Figma design
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Image.asset(menuItems[index]['image']!),
              title: Text(menuItems[index]['name']!),
              subtitle: Text(menuItems[index]['price']!),
              trailing: ElevatedButton(
                onPressed: () {
                  // Add to cart logic here
                },
                child: Text("Add to Cart"),
              ),
            ),
          );
        },
      ),
    );
  }
}
