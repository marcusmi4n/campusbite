import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Color(0xFF2C663B),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          CircleAvatar(radius: 50, backgroundColor: Colors.grey.shade300),
          SizedBox(height: 10),
          Center(child: Text("John Doe", style: TextStyle(fontSize: 18))),
          Center(child: Text("john@campus.ac.ug")),
          Divider(height: 40),
          _profileTile(Icons.edit, "Edit Profile", () {}),
          _profileTile(Icons.shopping_bag, "My Orders", () {}),
          _profileTile(Icons.favorite, "Saved Items", () {}),
          _profileTile(Icons.payment, "Payment Methods", () {}),
          _profileTile(Icons.location_on, "Delivery Locations", () {}),
          Divider(height: 30),
          _profileTile(Icons.logout, "Logout", () {}, color: Colors.red),
        ],
      ),
    );
  }

  Widget _profileTile(IconData icon, String label, VoidCallback onTap, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(label, style: TextStyle(color: color ?? Colors.black)),
      onTap: onTap,
    );
  }
}
