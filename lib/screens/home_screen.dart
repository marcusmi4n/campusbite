// lib/features/home/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:campusbite/features/chatbot/services/chatbot_service.dart';
import 'package:campusbite/features/chatbot/screens/chatbot_screen.dart';
import 'package:campusbite/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mood = '';
  List<String> _suggestions = [];
  bool _isLoading = false;

  Future<void> _getSuggestions() async {
    if (_mood.isEmpty) return;
    setState(() => _isLoading = true);

    try {
      final results = await ChatbotService.getMoodSuggestions(_mood);
      setState(() => _suggestions = results);
    } catch (e) {
      setState(
        () =>
            _suggestions = [
              'Vegetable Pizza',
              'Fruit Smoothie Bowl',
              'Grilled Chicken Salad',
            ],
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Showing fallback suggestions')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Mian!',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            Text(
              'Feeling Hungry Today?',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatbotScreen(),
                  ),
                ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => _mood = value,
                      decoration: InputDecoration(
                        hintText: "How's your day? Get food suggestions!",
                        suffixIcon:
                            _isLoading
                                ? const CircularProgressIndicator()
                                : IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: _getSuggestions,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_suggestions.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended For You',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ..._suggestions.map(
                    (s) => ListTile(
                      leading: const Icon(
                        Icons.restaurant,
                        color: AppColors.primary,
                      ),
                      title: Text(s),
                    ),
                  ),
                ],
              )
            else if (_isLoading)
              _buildLoadingSuggestions(),
            const SizedBox(height: 20),
            _buildCampusDeals(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingSuggestions() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(
          3,
          (index) => ListTile(
            leading: Container(width: 40, height: 40, color: Colors.white),
            title: Container(height: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildCampusDeals() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.local_offer, color: AppColors.primary),
              title: Text('20% Off Smoothies Today!'),
              subtitle: Text('Valid until 10 PM'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Grab Now')),
          ],
        ),
      ),
    );
  }
}
