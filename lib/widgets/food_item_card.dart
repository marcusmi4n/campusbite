import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campusbite/models/food_item.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;
  const FoodItemCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                foodItem.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'No 10 opp lekki phase 1 bridge...',
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        '${foodItem.rating}+',
                        style: GoogleFonts.quicksand(fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        'UGX ${foodItem.price.toStringAsFixed(2)}',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
