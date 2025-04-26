import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campusbite/screens/main_app/order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPaymentMethod = 'mastercard';
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout', style: GoogleFonts.quicksand())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address',
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.orange),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Smart Ideas, Innovation Hub',
                      style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Delivery Time: 20 mins',
                      style: GoogleFonts.quicksand(fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: GoogleFonts.quicksand(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Note to Courier (optional)', style: GoogleFonts.quicksand()),
            const SizedBox(height: 8),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                hintText: 'Any special instructions?',
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Text(
              'Payment',
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentOption('mastercard', Icons.credit_card),
                _buildPaymentOption('airtel money', Icons.phone_android),
                _buildPaymentOption('MTN', Icons.phone_iphone),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Order Summary',
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildOrderItem('Burger Meal (x2)', 'UGX 2800'),
            _buildOrderItem('Wrap (x1)', 'UGX 200'),
            _buildOrderItem('Delivery Fee', 'UGX 1000'),
            _buildOrderItem('Discount', '-UGX 500', isDiscount: true),
            const Divider(thickness: 2),
            _buildOrderItem('Total', 'UGX 3500', isTotal: true),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 0),
              ),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderSuccessScreen(),
                    ),
                  ),
              child: Text(
                'Pay now',
                style: GoogleFonts.quicksand(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String method, IconData icon) {
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = method),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _selectedPaymentMethod == method ? Colors.orange[50] : null,
          border: Border.all(
            color:
                _selectedPaymentMethod == method
                    ? Colors.orange
                    : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 8),
            Text(
              method == 'mastercard' ? 'Card' : method,
              style: GoogleFonts.quicksand(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(
    String label,
    String value, {
    bool isDiscount = false,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.quicksand(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount ? Colors.green : null,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.quicksand(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount ? Colors.green : null,
            ),
          ),
        ],
      ),
    );
  }
}
