// screens/checkout_screen.dart
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address :',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.orange),
                Text(
                  'Smart Ideas, Innovation Hub',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: GoogleFonts.poppins(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.orange),
                Text(
                  '+256 704288436',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: GoogleFonts.poppins(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Name : Mian',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 10),
            Text(
              'Delivery Time : 20 mins',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Note to Courier (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 30),
            Text(
              'Payment',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentMethod('assets/mastercard.png'),
                _buildPaymentMethod('assets/airtel.png'),
                _buildPaymentMethod('assets/mtn.png'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.money, color: Colors.orange),
                const SizedBox(width: 10),
                Text(
                  'Pay on arrival',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                  activeColor: Colors.orange,
                ),
              ],
            ),
            Text(
              'Pay with cash/POS upon arrival',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Order Summary :',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildOrderItem('Burger Meal (x2)', 'UGX 2800'),
            _buildOrderItem('Wrap (x1)', 'UGX 200'),
            _buildOrderItem('Delivery Fee', 'UGX 1000'),
            _buildOrderItem('Discount', 'UGX 500', isDiscount: true),
            const Divider(height: 30),
            _buildOrderItem('Total', 'UGX 3500', isTotal: true),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
                child: Text(
                  'Proceed to Payment',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight