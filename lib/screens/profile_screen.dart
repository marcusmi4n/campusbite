// screens/profile_screen.dart
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 15),
            Text(
              'Mian Tech',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('marcus.dianah@gmail.com', style: GoogleFonts.poppins()),
            const SizedBox(height: 30),
            _buildProfileItem('Edit Profile', Icons.edit),
            _buildProfileItem('My Orders', Icons.shopping_bag),
            _buildProfileItem('Saving Items', Icons.favorite),
            _buildProfileItem('Payment method', Icons.payment),
            _buildProfileItem('Delivery Locations', Icons.location_on),
            _buildProfileItem('Privacy policy', Icons.privacy_tip),
            _buildProfileItem('Settings', Icons.settings),
            _buildProfileItem('Log Out', Icons.logout, isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(
    String title,
    IconData icon, {
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : Colors.orange),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: isLogout ? Colors.red : Colors.black,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

// screens/settings_screen.dart
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _buildSettingItem('Notification Preferences', Icons.notifications),
            _buildSettingItem('App Theme', Icons.color_lens),
            _buildSettingItem('Language', Icons.language),
            _buildSettingItem('Terms & Conditions', Icons.description),
            _buildSettingItem('Help & Support', Icons.help),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: Text('Log Out', style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title, style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
