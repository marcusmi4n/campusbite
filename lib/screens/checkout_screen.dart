import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Color(0xFF2C663B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery Address", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(decoration: InputDecoration(hintText: "Enter your hall or hostel")),
            SizedBox(height: 20),
            Text("Payment Method", style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              title: Text("MTN Mobile Money"),
              leading: Radio(value: true, groupValue: true, onChanged: (_) {}),
            ),
            ListTile(
              title: Text("Airtel Money"),
              leading: Radio(value: false, groupValue: true, onChanged: (_) {}),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2C663B),
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {},
              child: Text("Confirm & Pay"),
            ),
          ],
        ),
      ),
    );
  }
}
