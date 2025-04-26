import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campusbite/screens/main_app/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Classic cheeseburger',
      'price': 1500.0,
      'quantity': 1,
      'image': 'https://via.placeholder.com/50',
      'restaurant': 'The Macdonalds',
    },
    {
      'name': 'Classic cheeseburger',
      'price': 1500.0,
      'quantity': 1,
      'image': 'https://via.placeholder.com/50',
      'restaurant': 'The Macdonalds',
    },
  ];

  double get _subtotal => _cartItems.fold(
      0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart', style: GoogleFonts.quicksand()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Dismissible(
                  key: Key(item['name']),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      _cartItems.removeAt(index);
                    });
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item['image']),
                    ),
                    title: Text(
                      item['name'],
                      style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['restaurant'],
                          style: GoogleFonts.quicksand(fontSize: 12),
                        ),
                        Text(
                          'UGX ${item['price']}',
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (item['quantity'] > 1) {
                                item['quantity']--;
                              }
                            });
                          },
                        ),
                        Text(
                          item['quantity'].toString(),
                          style: GoogleFonts.quicksand(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              item['quantity']++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Add note or instruction',
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.orange),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Location',
                          style: GoogleFonts.quicksand(fontSize: 12),
                        ),
                        Text(
                          'Smart Ideas, Innovation Hub',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change Location',
                        style: GoogleFonts.quicksand(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: GoogleFonts.quicksand(),
                    ),
                    Text(
                      'UGX $_subtotal',
                      style: GoogleFonts.quicksand(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: GoogleFonts.quicksand(),
                    ),
                    Text(
                      'UGX 1000',
                      style: GoogleFonts.quicksand(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: GoogleFonts.quicksand(),
                    ),
                    Text(
                      'UGX 500',
                      style: GoogleFonts.quicksand(color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(thickness: 2),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'UGX ${_subtotal + 1000 - 500}',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                  ),
                  child: Text(
                    'Proceed to payment',
                    style: GoogleFonts.quicksand(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}