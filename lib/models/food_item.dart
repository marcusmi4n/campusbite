class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double calories;
  final int preparationTime;
  final double rating;
  final String category;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.calories,
    required this.preparationTime,
    required this.rating,
    required this.category,
  });

  factory FoodItem.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return FoodItem(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: data['price']?.toDouble() ?? 0.0,
      imageUrl: data['imageUrl'] ?? '',
      calories: data['calories']?.toDouble() ?? 0.0,
      preparationTime: data['preparationTime'] ?? 0,
      rating: data['rating']?.toDouble() ?? 0.0,
      category: data['category'] ?? '',
    );
  }
}
