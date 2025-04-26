import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:campusbite/models/food_item.dart';
import 'package:campusbite/services/database_service.dart';
import 'package:campusbite/widgets/food_item_card.dart';
import 'package:campusbite/screens/main_app/search_screen.dart';
import 'package:campusbite/screens/main_app/cart_screen.dart';
import 'package:campusbite/screens/main_app/food_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Mian!',
              style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text(
                  'You\'re on Campus',
                  style: GoogleFonts.quicksand(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()),
                ),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ),
          ),
        ],
      ),
      body: StreamBuilder<List<FoodItem>>(
        stream: Provider.of<DatabaseService>(context).getFoodItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final foodItems = snapshot.data ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMoodPrompt(),
                const SizedBox(height: 24),
                _buildRecommendedSection(),
                const SizedBox(height: 24),
                _buildDealsBanner(),
                const SizedBox(height: 24),
                _buildPopularFoods(foodItems),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMoodPrompt() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'How\'s your day?',
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap to get food suggestions based on mood',
            style: GoogleFonts.quicksand(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended for You',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _FoodCategoryChip(label: 'Pizza'),
              _FoodCategoryChip(label: 'Burger'),
              _FoodCategoryChip(label: 'Sausage'),
              _FoodCategoryChip(label: 'Samosa'),
              _FoodCategoryChip(label: 'Pasta'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDealsBanner() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orange, Colors.deepOrange],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '20% Off Smoothies Today! 😊',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Use code: CAMPUS20',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Grab Now',
              style: GoogleFonts.quicksand(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularFoods(List<FoodItem> foodItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Foods',
              style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all (29)',
                style: GoogleFonts.quicksand(color: Colors.orange),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems[index];
            return GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoodDetailScreen(foodItem: foodItem),
                    ),
                  ),
              child: FoodItemCard(foodItem: foodItem),
            );
          },
        ),
      ],
    );
  }
}

class _FoodCategoryChip extends StatelessWidget {
  final String label;
  const _FoodCategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
      ),
    );
  }
}
