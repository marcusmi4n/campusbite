import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campusbite/screens/profile/orders_screen.dart';
import 'package:campusbite/screens/profile/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile', style: GoogleFonts.quicksand())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 16),
            Text(
              'Mian Tech',
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text('marcus.dianah@gmail.com', style: GoogleFonts.quicksand()),
            const SizedBox(height: 24),
            _buildProfileOption(
              icon: Icons.edit,
              label: 'Edit Profile',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.shopping_bag,
              label: 'My Orders',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OrdersScreen()),
                  ),
            ),
            _buildProfileOption(
              icon: Icons.favorite,
              label: 'Saving Items',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.credit_card,
              label: 'Payment method',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.location_on,
              label: 'Delivery Locations',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.privacy_tip,
              label: 'Privacy policy',
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.settings,
              label: 'Settings',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[50],
                foregroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: Text(
                'Log Out',
                style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(label, style: GoogleFonts.quicksand()),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
