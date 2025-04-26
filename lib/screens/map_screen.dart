// screens/map_screen.dart
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campus Map',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          // This would be replaced with a real map widget
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.map, size: 100, color: Colors.grey),
                const SizedBox(height: 20),
                Text(
                  'ICT Hub Nakawa\nADB Building\nFaculty of Computing',
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'Contact Us : +256704288436\nEmail Us : campus.bite@gmail.com',
                    style: GoogleFonts.poppins(),
                    textAlign: TextAlign.center,
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
                        'Order Now',
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
          ),
        ],
      ),
    );
  }
}

// screens/location_alert_screen.dart
class LocationAlertScreen extends StatelessWidget {
  const LocationAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'LOCATION ALERT',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      content: Text(
        'You are currently outside the delivery zone.',
        style: GoogleFonts.poppins(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Exit', style: GoogleFonts.poppins(color: Colors.orange)),
        ),
      ],
    );
  }
}
