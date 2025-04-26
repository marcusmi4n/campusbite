// screens/admin_panel_screen.dart
class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Panel',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stats Overview',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildStatCard('Orders', '22 Pending Orders'),
                const SizedBox(width: 15),
                _buildStatCard('Today\'s Sales', 'UGX 350,000'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Weekly Chart',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [BarChartRodData(toY: 5, color: Colors.orange)],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 8, color: Colors.orange)],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [BarChartRodData(toY: 6, color: Colors.orange)],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Breakfast');
                            case 1:
                              return Text('Lunch');
                            case 2:
                              return Text('Supper');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                _buildAdminOption('Manage Vendors', Icons.store),
                _buildAdminOption('Add/Edit Menu Items', Icons.restaurant_menu),
                _buildAdminOption('View Reports / Feedback', Icons.analytics),
              ],
            ),
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

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.poppins(color: Colors.grey)),
              const SizedBox(height: 10),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminOption(String title, IconData icon) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.orange),
              const SizedBox(height: 10),
              Text(
                title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
