import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C663B),
        elevation: 0,
        title: Text("CampusBite", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSearchBar(),
          SizedBox(height: 20),
          _buildDealsBanner(),
          SizedBox(height: 20),
          _buildQuickOptions(),
          SizedBox(height: 20),
          _buildPopularItems(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: "Search for food...",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDealsBanner() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Color(0xFF2C663B), Color(0xFFEAD637)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          "🔥 Today's Deal: UGX 2,000 Lunch Combo!",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildQuickOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _optionTile("Orders", Icons.fastfood, '/orders'),
        _optionTile("Cart", Icons.shopping_cart, '/cart'),
        _optionTile("Chat", Icons.chat, '/chat'),
        _optionTile("Profile", Icons.person, '/profile'),
      ],
    );
  }

  Widget _optionTile(String label, IconData icon, String route) {
    return InkWell(
      onTap: () {
        // Later use Navigator.pushNamed(context, route)
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF2C663B),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPopularItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular Today", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 10),
        _foodItemCard("Chicken Pilau", "UGX 4,000", "assets/pilau.png"),
        _foodItemCard("Chips & Sausage", "UGX 3,500", "assets/chips.png"),
      ],
    );
  }

  Widget _foodItemCard(String name, String price, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50),
        title: Text(name),
        subtitle: Text(price),
        trailing: Icon(Icons.add),
        onTap: () {
          // Navigate to food detail or add to cart
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFF2C663B),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Menu"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
