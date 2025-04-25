import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {"name": "Rolex", "price": "UGX 3,000", "qty": 1},
    {"name": "Pilau", "price": "UGX 4,000", "qty": 2},
  ];

  @override
  Widget build(BuildContext context) {
    double total = 11000;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Color(0xFF2C663B),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item["name"]),
                  subtitle: Text("Qty: ${item["qty"]}"),
                  trailing: Text(item["price"]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("UGX $total", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2C663B),
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text("Proceed to Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
