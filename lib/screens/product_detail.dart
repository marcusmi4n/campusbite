import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productName = "Pizza Margherita";
  final String productDescription = "Delicious Margherita pizza with mozzarella cheese and fresh basil.";
  final double price = 12000.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/pizza.jpg"), // Product image
            SizedBox(height: 10),
            Text(productName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(productDescription),
            SizedBox(height: 20),
            Text("Price: UGX $price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add to cart logic
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
