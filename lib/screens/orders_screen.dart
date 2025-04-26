// screens/orders_screen.dart
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your orders',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(text: 'Complete orders'), Tab(text: 'Pending orders')],
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList(isComplete: true),
          _buildOrderList(isComplete: false),
        ],
      ),
    );
  }

  Widget _buildOrderList({required bool isComplete}) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        OrderItem(
          vendor: 'The Macdonalds',
          item: 'Classic cheesburger',
          price: 'UGX 3500',
          quantity: 1,
          isComplete: isComplete,
        ),
        OrderItem(
          vendor: 'The Macdonalds',
          item: 'Classic cheesburger',
          price: 'UGX 3500',
          quantity: 1,
          isComplete: isComplete,
        ),
        OrderItem(
          vendor: 'The Macdonalds',
          item: 'Classic cheesburger',
          price: 'UGX 3500',
          quantity: 1,
          isComplete: isComplete,
        ),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final String vendor;
  final String item;
  final String price;
  final int quantity;
  final bool isComplete;

  const OrderItem({
    super.key,
    required this.vendor,
    required this.item,
    required this.price,
    required this.quantity,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  vendor,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
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
                Text(item, style: GoogleFonts.poppins()),
                const Spacer(),
                Text('x$quantity', style: GoogleFonts.poppins()),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                if (isComplete)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[50],
                      foregroundColor: Colors.orange,
                    ),
                    onPressed: () {},
                    child: Text('Order Again', style: GoogleFonts.poppins()),
                  ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    isComplete ? 'View Details' : 'Track Order',
                    style: GoogleFonts.poppins(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
