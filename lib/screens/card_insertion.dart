import 'package:flutter/material.dart';

class CardInsertionScreen extends StatefulWidget {
  @override
  _CardInsertionScreenState createState() => _CardInsertionScreenState();
}

class _CardInsertionScreenState extends State<CardInsertionScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Payment Method")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(labelText: "Card Number"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _expiryController,
              decoration: InputDecoration(labelText: "Expiry Date (MM/YY)"),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _cvvController,
              decoration: InputDecoration(labelText: "CVV"),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle card submission
              },
              child: Text("Save Card"),
            ),
          ],
        ),
      ),
    );
  }
}
