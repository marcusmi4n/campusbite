// screens/menu_screen.dart
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for food',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory('BreakFast'),
                  _buildCategory('Lunch'),
                  _buildCategory('Supper'),
                  _buildCategory('Drinks'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'BreakFast',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildMenuItem(
              'Big cheese burger',
              'No 10 opp lekki phase 1 bridge in sangotedo estate',
              'UGX 3500',
              'assets/burger1.png',
            ),
            const SizedBox(height: 20),
            Text(
              'Supper',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildMenuItem(
              'Medium cheese burger',
              'No 10 opp lekki phase 1 bridge in sangotedo estate',
              'UGX 3500',
              'assets/burger2.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(name, style: GoogleFonts.poppins())),
    );
  }

  Widget _buildMenuItem(
    String name,
    String description,
    String price,
    String image,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.orange),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
