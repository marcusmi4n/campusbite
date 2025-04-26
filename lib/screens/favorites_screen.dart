// screens/favorites_screen.dart
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorites',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite_border, size: 50, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              'You have no favorite items yet.',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
                child: Text(
                  'Browse Menu',
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
}

// screens/deals_screen.dart
class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deals & Offers',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'category',
                    child: Text('Filter By Category'),
                  ),
                  const PopupMenuItem(
                    value: 'expiry',
                    child: Text('Filter By Expiry Date'),
                  ),
                ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildDealItem(
            '20% Off Rolex',
            'Available until Friday',
            'Apply Offer',
          ),
          _buildDealItem(
            'Free Juice on Orders Over UGX 15K',
            'Valid for all orders above UGX 15,000',
            'Use Deal',
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Text(
                'Browse Menu',
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
    );
  }

  Widget _buildDealItem(String title, String description, String buttonText) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(description, style: GoogleFonts.poppins()),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {},
                child: Text(
                  buttonText,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// screens/notifications_screen.dart
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear All',
              style: GoogleFonts.poppins(color: Colors.orange),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildNotificationItem(
            'Order Update',
            'Your order #1234 has been dispatched.',
            '2 mins ago',
          ),
          _buildNotificationItem(
            'New Offer',
            'Get 20% off all meals this Friday!',
            '1 hour ago',
          ),
          _buildNotificationItem(
            'System Alert',
            'Campus Map updated with new canteen spots.',
            'Yesterday',
          ),
          _buildNotificationItem(
            'Feedback Reply',
            'Thanks for your review! We value your feedback.',
            '2 days ago',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String message, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  time,
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(message, style: GoogleFonts.poppins()),
          ],
        ),
      ),
    );
  }
}
