import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favorites = ["Pizza", "Burger", "Pasta"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index]),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                // Remove from favorites logic here
              },
            ),
          );
        },
      ),
    );
  }
}
