import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campusbite/models/food_item.dart';
import 'package:campusbite/widgets/quantity_selector.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodItem foodItem;
  const FoodDetailScreen({super.key, required this.foodItem});

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _quantity = 1;
  String? _selectedTopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.foodItem.name,
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(widget.foodItem.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.foodItem.rating}+',
                        style: GoogleFonts.quicksand(),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.local_fire_department,
                        color: Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.foodItem.calories} cal',
                        style: GoogleFonts.quicksand(),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.timer, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.foodItem.preparationTime} min',
                        style: GoogleFonts.quicksand(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.foodItem.name,
                    style: GoogleFonts.quicksand(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.foodItem.description,
                    style: GoogleFonts.quicksand(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'UGX ${widget.foodItem.price.toStringAsFixed(2)}',
                    style: GoogleFonts.quicksand(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Toppings for you',
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildToppingChip('Regular Bun'),
                      _buildToppingChip('Cheese'),
                      _buildToppingChip('Meat Sauce'),
                      _buildToppingChip('Extra Veggies'),
                      _buildToppingChip('Spicy Mayo'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      QuantitySelector(
                        quantity: _quantity,
                        onChanged: (value) => setState(() => _quantity = value),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Add to cart',
                            style: GoogleFonts.quicksand(fontSize: 16),
                          ),
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

  Widget _buildToppingChip(String label) {
    return ChoiceChip(
      label: Text(label, style: GoogleFonts.quicksand()),
      selected: _selectedTopping == label,
      onSelected: (selected) {
        setState(() {
          _selectedTopping = selected ? label : null;
        });
      },
    );
  }
}
