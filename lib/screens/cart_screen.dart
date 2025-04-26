// screens/cart_screen.dart
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery to', style: GoogleFonts.poppins(fontSize: 14)),
            Text(
              'Smart Ideas, Innovation Hub',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const CartItem(
                    vendor: 'The Macdonalds',
                    item: 'Classic cheesburger',
                    price: 'UGX 1500',
                    quantity: 1,
                  ),
                  const CartItem(
                    vendor: 'The Macdonalds',
                    item: 'Classic cheesburger',
                    price: 'UGX 1500',
                    quantity: 1,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Add note or instruction',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.orange),
                      Text(
                        'Delivery Location : Smart Ideas, Innovation Hub',
                        style: GoogleFonts.poppins(),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change Location',
                          style: GoogleFonts.poppins(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildPriceRow('Subtotal :', 'UGX 3000'),
                _buildPriceRow('Delivery Fee :', 'UGX 1000'),
                _buildPriceRow('Discount :', 'UGX 500', isPromo: true),
                const Divider(height: 30),
                _buildPriceRow('Total :', 'UGX 3,500', isTotal: true),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Process to payment',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String value, {
    bool isPromo = false,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: isPromo ? Colors.green : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: isPromo ? Colors.green : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String vendor;
  final String item;
  final String price;
  final int quantity;

  const CartItem({
    super.key,
    required this.vendor,
    required this.item,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  vendor,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(item, style: GoogleFonts.poppins()),
                const Spacer(),
                Text(
                  price,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(quantity.toString(), style: GoogleFonts.poppins()),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {},
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
