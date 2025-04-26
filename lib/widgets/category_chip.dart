// lib/widgets/category_chip.dart
import 'package:flutter/material.dart';
import 'package:campusbite/constants/colors.dart';

class CategoryChip extends StatelessWidget {
  final String name;
  final IconData icon;

  const CategoryChip({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primaryLight,
            child: Icon(icon, color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}