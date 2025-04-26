// screens/food_detail_screen.dart
class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery to Smart Ideas, Innovation Hub',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.add_circle_outline),
                const SizedBox(width: 5),
                Text(
                  '2 +',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Big boys Cheese burger',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('4+', style: GoogleFonts.poppins(color: Colors.orange)),
                const SizedBox(width: 10),
                Text('300cal', style: GoogleFonts.poppins()),
                const SizedBox(width: 10),
                Text('5-10min', style: GoogleFonts.poppins()),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Our simple, classic cheeseburger begins with a 100% pure beef burger seasoned with just a pinch of salt and pepper. The McDonald\'s Cheeseburger is topped.....more',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 20),
            Text(
              'UGX 3500',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Toppings for you',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _buildTopping('Regular Bun'),
                _buildTopping('Cheese'),
                _buildTopping('Meat sauce'),
              ],
            ),
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
                  'Add to cart',
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
    );
  }

  Widget _buildTopping(String name) {
    return Chip(label: Text(name), backgroundColor: Colors.grey[200]);
  }
}
