// lib/widgets/food_item_card.dart
import 'package:flutter/material.dart';
import 'package:campusbite/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemCard extends StatelessWidget {
  final String name;
  final String description;
  final String rating;
  final String price;
  final String image;

  const FoodItemCard({
    super.key,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: AppColors.rating,
                        size: 16,
                      ),
                      Text(
                        rating,
                        style: GoogleFonts.poppins(color: AppColors.rating),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        price,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: AppColors.primary),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
